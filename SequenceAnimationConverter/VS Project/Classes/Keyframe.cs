using System;
using System.Collections.Generic;
using System.Text;

namespace SequenceAnimationConverter
{
    class Keyframe
    {
        public string Id;
        public int Key;
        public int Length;
        public ChannelData ChannelData;
        public Keyframe(dynamic keyframe)
        {
            Id = keyframe.id;
            Key = keyframe.Key;
            Length = keyframe.Length;
            ChannelData = new ChannelData(keyframe.Channels.ToObject<dynamic>());
        }
        public void Print()
        {
            Console.WriteLine($"----Keyframe(id: {Id}; key: {Key}; length: {Length};)");
            ChannelData.Print();
        }
    }
}
