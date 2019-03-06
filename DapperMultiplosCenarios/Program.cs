using Dapper;
using DapperMultiplosCenarios.Models;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;

namespace DapperMultiplosCenarios
{
    class Program
    {
        static void Main(string[] args)
        {
            using (var connection = new SqlConnection("Data Source=USER-PC;Initial Catalog=DbTeste;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False"))
            {
                connection.Open();

                var query = "BuscarUsuarioInvestimento";
                var investimentoDictionary = new Dictionary<int, Usuario>();

                var result = connection.Query<Usuario, Sexo, Investimento, Empresa, Usuario >(query,
                    (us, sex, inv, emp) =>
                    {
                        if (!investimentoDictionary.TryGetValue(us.Id, out Usuario usuario))
                        {
                            usuario = us;
                            investimentoDictionary.Add(us.Id, usuario);
                        }

                        if (!usuario.Investimento.Any(x=>x.Nome == inv.Nome))
                        {
                            usuario.Investimento.Add(inv);
                        }

                        if (!usuario.Empresa.Any(x => x.Nome == emp.Nome))
                        {
                            usuario.Empresa.Add(emp);
                        }

                        //usuario.Empresa.Add(new Empresa() { Nome = emp.Nome });
                        usuario.Sexo = new Sexo() { Nome = sex.Nome };

                        return usuario;
                    },
                    splitOn: "SexoId,InvestId, EmpresId",
                    param: null,
                    commandType: CommandType.StoredProcedure

                    ).Distinct().ToList();
            }
        }
    }
}
