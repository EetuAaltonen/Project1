using System;
using System.Collections.Generic;
using System.Linq;

namespace SequenceAnimationConverter
{
    class TrackData
    {
        public string ObjectName;
        public IEnumerable<Track> Tracks;
        public TrackData(dynamic trackData)
        {
            ObjectName = trackData.name;
            Tracks = ((IEnumerable<dynamic>) trackData.tracks.ToObject<IEnumerable<dynamic>>()).Select(x => new Track(x));
        }
        public void Print()
        {
            Console.WriteLine($"TrackData(ObjectName: {ObjectName};)");
            foreach (Track track in Tracks)
            {
                track.Print();
            }
        }
        /*public AnimationStep Convert()
        {
            return new AnimationStep();
        }*/
    }
}
