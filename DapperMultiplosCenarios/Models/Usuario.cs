using System.Collections.Generic;

namespace DapperMultiplosCenarios.Models
{
    public class Usuario
    {
        public int Id { get; set; }
        public string Nome { get; set; }
        public string Descricao { get; set; }

        public Sexo Sexo { get; set; }
        public List<Investimento> Investimento { get; set; } = new List<Investimento>();
        public List<Empresa> Empresa { get; set; } = new List<Empresa>();
    }
}
