using System;
using System.Collections.Generic;
using System.Text;

namespace SequenceAnimationConverter
{
    class Track
    {
        public string Name;
        public KeyframeData KeyframeData;
        public Track(dynamic track)
        {
            Name = track.name;
            KeyframeData = new KeyframeData(track.keyframes.ToObject<dynamic>());
        }
        public void Print()
        {
            Console.WriteLine($"--Track(name: {Name};)");
            KeyframeData.Print();
        }
    }
}
