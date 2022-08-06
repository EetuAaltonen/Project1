using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Numerics;
using System.Threading.Tasks;

namespace SequenceAnimationConverter
{
    class Program
    {
        public static readonly string SOURCE_FILE_PATH = @"D:\Project1\SequenceAnimationConverter\Sequences\seq_player_flip.yy";
        public static readonly string CONVERT_FILE_PATH = @"D:\Project1\SequenceAnimationConverter\Converts\seq_player_flip.txt";
        public static readonly string TRANSFORM_PARENT = "obj_player";
        public static readonly string ANIMATION_INDEX_PREFIX = "PlayerFlip";
        public static readonly string[] ANIMATION_STEP_FILTER = { "rotation" };

        static void Main(string[] args)
        {
            LoadJson(SOURCE_FILE_PATH);
            Console.WriteLine("Program finished...");
        }

        static public async void LoadJson(string filePath)
        {
            using StreamReader streamReader = new StreamReader(filePath);
            string json = streamReader.ReadToEnd();
            dynamic sequenceFile = JsonConvert.DeserializeObject(json);

            IEnumerable<TrackData> trackData = ((IEnumerable<dynamic>)sequenceFile.tracks.ToObject<IEnumerable<dynamic>>()).Select(x => new TrackData(x));
            IEnumerable<AnimationStep> animationSteps = ConvertTrackDataListToAnimationSteps(trackData);
            List<string> lines = new List<string>();
            string lastAnimationIndex = "";
            lines.Add($"// {ANIMATION_INDEX_PREFIX.ToUpper()}");
            foreach (AnimationStep animationStep in animationSteps)
            {
                if (lastAnimationIndex != animationStep.AnimationIndex) {
                    lines.Add($"// {animationStep.AnimationIndex}");
                    lastAnimationIndex = animationStep.AnimationIndex;
                }
                lines.Add(animationStep.Print());
            }
            await WriteConvertFile(lines.ToArray());
        }

        static public IEnumerable<AnimationStep> ConvertTrackDataListToAnimationSteps(IEnumerable<TrackData> trackDataList)
        {
            List<AnimationStep> animationSteps = new List<AnimationStep>();
            TrackData parentTrackData = trackDataList.FirstOrDefault(x => x.ObjectName == TRANSFORM_PARENT);
            Dictionary<int, AnimationStep> tempAnimationSteps = new Dictionary<int, AnimationStep>();

            if (parentTrackData != null)
            {
                foreach (TrackData trackData in trackDataList)
                {
                    
                    foreach (Track track in trackData.Tracks)
                    {
                        if (ANIMATION_STEP_FILTER.FirstOrDefault(x => x == track.Name) != null)
                        {
                            Track parentTrack = parentTrackData.Tracks.FirstOrDefault(x => x.Name == track.Name);
                            int lastKey = 0;
                            foreach (Keyframe keyframe in track.KeyframeData.Keyframes)
                            {
                                if (keyframe.Key >= 0) {
                                    Keyframe parentKeyFrame = parentTrack.KeyframeData.Keyframes.FirstOrDefault(x => x.Key == keyframe.Key);
                                    if (parentKeyFrame != null) {
                                        foreach (Channel channel in keyframe.ChannelData.Channels)
                                        {
                                            Channel parentChannel = parentKeyFrame.ChannelData.Channels.FirstOrDefault(x => x.Id == channel.Id);
                                            double parentRealValue = trackData.ObjectName != parentTrackData.ObjectName ? parentChannel.RealValue : 0.0;
                                            int newRealValue = channel.CalculateRealValueWithParentValue(parentRealValue);

                                            AnimationStep tempAnimationStep;
                                            if (!tempAnimationSteps.TryGetValue(keyframe.Key, out tempAnimationStep))
                                            {
                                                string removeSuffix = $"{TRANSFORM_PARENT}_";
                                                int index = trackData.ObjectName.IndexOf(removeSuffix);
                                                string objectSuffix = (index < 0 || trackData.ObjectName == removeSuffix) ? trackData.ObjectName : trackData.ObjectName.Remove(index, removeSuffix.Length);

                                                string animationIndex = $"AnimationIndex.{ANIMATION_INDEX_PREFIX} {objectSuffix}";
                                                // TODO: Fetch InteractionTriggerValue from Broadcast Message
                                                tempAnimationStep = new AnimationStep(animationIndex, 0, 0, new Vector2(), new Vector2(), 0, 0, "undefined");
                                                tempAnimationSteps.Add(keyframe.Key, tempAnimationStep);
                                                tempAnimationStep.TransitionTime = keyframe.Key - lastKey;
                                                tempAnimationStep.Duration = keyframe.Length - 1;
                                                lastKey = keyframe.Key;
                                            }

                                            switch (track.Name)
                                            {
                                                case "position":
                                                    {
                                                        if (channel.Id == 0)
                                                        {
                                                            tempAnimationStep.Offset.X = newRealValue;
                                                        } else
                                                        {
                                                            tempAnimationStep.Offset.Y = newRealValue;
                                                        }
                                                    } break;
                                                case "rotation":
                                                    {
                                                        tempAnimationStep.Rotation = newRealValue;
                                                    } break;
                                                case "scale":
                                                    {
                                                        if (channel.Id == 0)
                                                        {
                                                            tempAnimationStep.Scale.X = newRealValue;
                                                        }
                                                        else
                                                        {
                                                            tempAnimationStep.Scale.Y = newRealValue;
                                                        }
                                                    }
                                                    break;
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    foreach (KeyValuePair<int, AnimationStep> keyValuePair in tempAnimationSteps)
                    {
                        animationSteps.Add(keyValuePair.Value);
                    }
                    tempAnimationSteps = new Dictionary<int, AnimationStep>();
                }
            }
            
            return animationSteps;
        }

        public static async Task WriteConvertFile(string[] lines)
        {
            await File.WriteAllLinesAsync(CONVERT_FILE_PATH, lines);
        }
    }
}
