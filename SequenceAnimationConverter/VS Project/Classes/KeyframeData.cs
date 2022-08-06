using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SequenceAnimationConverter
{
    class KeyframeData
    {
        public IEnumerable<Keyframe> Keyframes;
        public KeyframeData(dynamic keyframeData)
        {
            Keyframes = ((IEnumerable<dynamic>) keyframeData.Keyframes.ToObject<IEnumerable<dynamic>>()).Select(x => new Keyframe(x));
        }
        public void Print()
        {
            foreach (Keyframe keyframe in Keyframes) {
                keyframe.Print();
            }
        }
    }
}
