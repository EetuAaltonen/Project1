using System;
using System.Collections.Generic;
using System.Numerics;
using System.Text;

namespace SequenceAnimationConverter
{
    class AnimationStep
    {
        public string AnimationIndex;
        public int TransitionTime;
        public int Duration;
        public Vector2 Offset;
        public Vector2 Scale;
        public int Rotation;
        public int Depth;
        public string InteractionTriggerValue;

        public AnimationStep(string animationIndex, int transitionTime, int duration, Vector2 offset, Vector2 scale, int rotation, int depth, string interactionTriggerValue)
        {
            AnimationIndex = animationIndex;
            TransitionTime = transitionTime;
            Duration = duration;
            Offset = offset;
            Scale = scale;
            Rotation = rotation;
            Depth = depth;
            InteractionTriggerValue = interactionTriggerValue;
        }
        public string Print()
        {
            string offsetString = Offset.X != 0 && Offset.Y != 0 ? $"new Vector2({Offset.X}, {Offset.Y})" : "undefined";
            string scaleString = Scale.X != 0 && Scale.Y != 0 ? $"new Scale({Scale.X}, {Scale.Y})" : "undefined";
            return $"new AnimationStep({AnimationIndex}, {TransitionTime}, {Duration}, {offsetString}, {scaleString}, {Rotation}, {Depth}, {InteractionTriggerValue}),";
        }
    }
}
