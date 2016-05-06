<!DOCTYPE html>
<html>
 
 <link rel="stylesheet" href="css\agency-lite\assets\css\bootstrap.css">
 
  <head>
    <title>Calculadora</title>
  </head>
 
 
<body>
    <h1 align= "center"> IMC </h1>
    <hr>
    <table  width =100% >
        <tr ></tr>
        <tr>
        <td align ="center">
       
        <br>
        <form>
            <table width = 25% height = 100%>
            <tr>
            <td>Peso: </td>
            <td><input name = "mPeso"> </td>
            </tr>
            <tr>
            <td>Altura: </td>
            <td><input name="mAltura"></td>
            </tr>
            <tr>
            <td>
            <select name = "combow">
                <option value="Masculino">Masculino</option>
                <option value="Feminino">Feminino</option>
            </select>
            </td>
            <td >
            <button>Calcular</button>
            </td>
            </tr>
            </table>
 
            <br>
            <%
                String massa = request.getParameter ("mPeso");
                if (massa == "" || massa == null)
                    massa = "0";
                float fmassa = Float.parseFloat (massa);
               
                String altura = request.getParameter ("mAltura");
                if (altura == "" || altura == null)
                    altura = "0";
                float faltura = Float.parseFloat (altura);
               
                float imc =  fmassa / (faltura * faltura);
               
                String[] mensagens = {"Magreza grave" , "Magreza moderada" ,
                    "Magreza leve" , "Saudável" , "Sobrepeso" ,"Obesidade Grau I" ,
                    "Obesidade Grau II (severa)" , "Obesidade GrauIII (mórbida)"
                    };
                   
                float[] limitesMasculinos = {16f,17f,18.5f,25f,30f,35f,40f};
                float[] limitesFemininos = {15f,16f,18.5f,21f,30f,35f,40f};
               
                float[] limiteEscolhido ;
 
                String sexo = request.getParameter("combow");
                if (sexo == null)
                	sexo = "Masculino";
                limiteEscolhido = sexo.equals("Masculino") ? limitesMasculinos : limitesFemininos;
               
                           
                String resposta = "IMC = " + imc + " ";
               
                boolean flag = false;
                for (int i = 0 ; i < 7;i++){
                    if (imc < limiteEscolhido[i]){
                        resposta += mensagens[i];
                        flag = true;
                        break;
                    }
                }if (!flag)
                    resposta += mensagens[7];
 
                if (imc > 0)
                    out.print(resposta);
               
            %>
        </form>
        </td>
        </tr>
        <tr></tr>
    </table>
</body>
</html>