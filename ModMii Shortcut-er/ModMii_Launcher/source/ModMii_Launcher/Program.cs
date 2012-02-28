using System.Diagnostics;
using System.Windows.Forms;
using System;
using System.Runtime.InteropServices;

//Launcher written by person66

namespace ModMii_Launcher
{
    class Program
    {
        [DllImport("kernel32.dll")]
        static extern bool FreeConsole();
        [DllImport("kernel32.dll")]
        static extern bool AllocConsole();
        [DllImport("kernel32.dll")]
        static extern bool AttachConsole(uint dwProcessId);
        [DllImport("User32.dll")]
        public static extern Int32 SetForegroundWindow(int hWnd);   

        static void Main(string[] args)
        {
            if (args.Length <= 0)
            {
                Process[] processes = Process.GetProcessesByName("cmd");
                foreach (Process x in processes)
                {
                    FreeConsole();
                    AttachConsole(Convert.ToUInt16(x.Id));
                    if (Console.Title == "ModMii")
                        AlreadyOpen(args);
                }
                processes = Process.GetProcessesByName("WizApp");
                foreach (Process x in processes)
                {
                    if (x.MainWindowTitle == "ModMii Skin")
                        AlreadyOpen(args);
                }
            }
            FreeConsole();
            AllocConsole();
            SetForegroundWindow(System.Diagnostics.Process.GetCurrentProcess().MainWindowHandle.ToInt32());
            RunApp(args);
        }

        private static void AlreadyOpen(string[] args)
        {
            DialogResult msg = MessageBox.Show("It appears as if you already have a ModMii Window open.\n\nRunning more than one instance of ModMii at a time is not\nrecommended and may get buggy.\n\nAre you sure you wish to continue?", "WARNING", MessageBoxButtons.YesNo, MessageBoxIcon.Exclamation);
            if (msg == DialogResult.No)
                Environment.Exit(0);
        }

        private static void RunApp(string[] args)
        {
            Console.Title = "ModMii";
            Process p = new Process();
            p.StartInfo.FileName = Environment.GetEnvironmentVariable("COMSPEC");
            p.StartInfo.Arguments = " /c call " + "\"" + Application.StartupPath + "/Support/ModMii.bat\" " + string.Join(" ", args);
            p.StartInfo.WorkingDirectory = Application.StartupPath + "/Support/";
            p.StartInfo.UseShellExecute = false;
            p.Start();
            if (args.Length > 0)
            {
                p.WaitForExit();
            }
        }
    }
}