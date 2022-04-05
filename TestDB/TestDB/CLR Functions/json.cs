using System;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using Microsoft.SqlServer.Server;
using System.Runtime.Serialization;
using System.Runtime.Serialization.Json;
using System.Collections.Generic;

public partial class UserDefinedFunctions
{
    [Microsoft.SqlServer.Server.SqlFunction]
    public static SqlString json(string spellData)
    {
        // Put your code here
        DataContractJsonSerializer js = new DataContractJsonSerializer(typeof(KbaQuestions));

        
        MemoryStream ms = new MemoryStream(System.Text.ASCIIEncoding.ASCII.GetBytes(spellData));


        KbaQuestions fireBall = (KbaQuestions)js.ReadObject(ms);

        //return new SqlString (fireBall.QuestionText);
        return new SqlString("test");
    }
}

[DataContract]
//class Spell
//{
//    [DataMember(Name = "cast", IsRequired = true)]
//    public String cast;

//    [DataMember(Name = "cooldown", IsRequired = true)]
//    public String cooldown;

//    [DataMember(Name = "powerCost", IsRequired = true)]
//    public String cost;

//    [DataMember(Name = "description", IsRequired = true)]
//    public String description;

//    [DataMember(Name = "icon", IsRequired = false)]
//    public String icon;

//    [DataMember(Name = "id", IsRequired = true)]
//    public Int16 id;

//    [DataMember(Name = "name", IsRequired = true)]
//    public String name;

//    [DataMember(Name = "range", IsRequired = true)]
//    public String range;
//}

public class KbaQuestions
{
    public string QuestionText { get; set; }
    public string DisplayedQuestionText { get; set; }
    public List<string> Answers { get; set; }
    public int CorrectAnswerIndex { get; set; }
    public object SelectedAnswerIndex { get; set; }
}