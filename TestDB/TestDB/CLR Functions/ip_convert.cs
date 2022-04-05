using System;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using Microsoft.SqlServer.Server;
using System.Collections;

public partial class UserDefinedFunctions
{
    [Microsoft.SqlServer.Server.SqlFunction]
    public static SqlInt64 ip_convert(string strIP)
    {
        System.Net.IPAddress address;
        System.Numerics.BigInteger ipnum = 0;

        if (System.Net.IPAddress.TryParse(strIP, out address))
        {
            byte[] addrBytes = address.GetAddressBytes();

            if (System.BitConverter.IsLittleEndian)
            {
                System.Collections.Generic.List<byte> byteList = new System.Collections.Generic.List<byte>(addrBytes);
                byteList.Reverse();
                addrBytes = byteList.ToArray();
            }

            if (addrBytes.Length > 8)
            {
                //IPv6
                ipnum = System.BitConverter.ToUInt64(addrBytes, 8);
                ipnum <<= 64;
                ipnum += System.BitConverter.ToUInt64(addrBytes, 0);
            }
            else
            {
                //IPv4
                ipnum = System.BitConverter.ToUInt32(addrBytes, 0);
            }
        }

        try
        {
           
            return (Int64)ipnum;

           
        }
        catch { return (long)0; }
    }

}