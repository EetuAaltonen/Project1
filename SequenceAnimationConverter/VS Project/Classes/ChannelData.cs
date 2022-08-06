using System;
using System.Collections.Generic;

namespace SequenceAnimationConverter
{
    class ChannelData
    {
        public IEnumerable<Channel> Channels;
        public ChannelData(dynamic channel)
        {
            Channels = MapChannels(channel);
        }
        public IEnumerable<Channel> MapChannels(dynamic channel)
        {
            List<Channel> channels = new List<Channel>();
            int i = 0;
            while (true)
            {
                dynamic chnnl = channel[i.ToString()];
                if (chnnl != null)
                {
                    channels.Add(new Channel(i, chnnl));
                } else
                {
                    break;
                }
                i++;
            }
            return channels;
        }
        public void Print()
        {
            foreach (Channel channel in Channels)
            {
                channel.Print();
            }
        }
    }
}
