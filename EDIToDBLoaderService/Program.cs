using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceProcess;
using System.Text;
using System.Threading.Tasks;
using Topshelf;

namespace EDIToDBLoaderService
{
    static class Program
    {
        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        static void Main()
        {
            var exitCode = HostFactory.Run(x=> {
                x.Service<EDIToDb>(s =>
                {
                    s.ConstructUsing(editodb=>new EDIToDb());
                    s.WhenStarted(editodb=>editodb.start());
                    s.WhenStopped(editodb=>editodb.stop());

                });
                x.RunAsLocalSystem();
                x.SetServiceName("AngularMedicalGroup");
                x.SetDisplayName("Angular Medical Group");
                x.SetDescription("For Dumping EDI data to Database Server");
            });
            int exitCodeValue = (int)Convert.ChangeType(exitCode,exitCode.GetTypeCode());
            Environment.ExitCode = exitCodeValue;
        }
    }
}
