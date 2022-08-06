using System;
using System.Collections.Generic;
using System.Text;

namespace SequenceAnimationConverter
{
    class Channel
    {
        public int Id;
        public double RealValue;
        public Channel(int id, dynamic channel)
        {
            Id = id;
            RealValue = channel.RealValue;
        }
        public int CalculateRealValueWithParentValue(double parentValue)
        {
            return (int)Math.Round(RealValue - parentValue);
        }
        public void Print()
        {
            Console.WriteLine($"------Channel(id: {Id}; realValue: {RealValue};)");
        }
    }
}
