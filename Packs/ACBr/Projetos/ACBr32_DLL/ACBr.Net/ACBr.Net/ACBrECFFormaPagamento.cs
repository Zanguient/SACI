﻿using System;
using System.Runtime.InteropServices;
using System.Linq;
using System.Text;

namespace ACBr.Net
{
    public sealed class ACBrECFFormaPagamento
    {
        public string Indice { get; internal set; }
        public string Descricao { get; internal set; }
        public bool PermiteVinculado { get; internal set; }
        public decimal Total { get; internal set; }
    }

}
