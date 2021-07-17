using System;
using System.Threading;

namespace SampleApp
{
    class Program
    {
        /// <summary>
        /// Write hello world every 30 seconds. Keep going until the app is terminated.
        /// </summary>
        /// <param name="args"></param>
        static void Main(string[] args)
        {
            const int secondsToWait = 30;
            while(0 < 1)
            {
                Console.WriteLine($"Hello World! See you again in {secondsToWait} seconds.");

                Thread.Sleep(secondsToWait * 1000);
            }
        }
    }
}
