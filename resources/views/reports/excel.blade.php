</html>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Formulario HCU-005H </title>


    <style>
        /* Colores
            * #B3B3B3 =  Gris
            * #97EA8B = Verde
            * #F6FD75 = Amarillo
            * #85CAEF = Celeste
            * #FFFFFF = Blanco
            * #CBDDE6 = Celeste bajo
         */

        #header {
            /* position: fixed; */
            /* top: 0px;
            left: 0px;
            right: 0px; */

        }

        /* Estilo para configurar el tamaño de todas las tablas */
        table {
            width: 100%;
            border-collapse: collapse;
        }

        /* Estilo para configurar el encabezado, nombre de la institucion, ciudad, etc */
        .configTableCabecera span {
            font-size: 9pt;
            color: #000000;
            font-weight: bold;
            border: hidden;
        }

        /* Estilo para configurar el borde, el fondo, tamña de la letra */
        .configTableCaberaAll th {
            background-color: #97EA8B;
            font-size: 7pt;
            font-weight: bold;
            border: 1px solid black;
        }

        /* Estilo para configurar los bordes de los items  */
        .configBorderItem td {
            border: 1px solid black;
        }

        /* Estilo para configurar el texto a 2 ANTECEDENTES PERSONALES */
        .configTextItem2 td {
            text-align: left;
            font-size: 8pt;
            
        }

        .topCabecera {
            margin-top: 58px;
        }
        .cabeceras {
            background-color: #B3B3B3;
            font-size: 9pt;
            font-weight: bold;
        }
    </style>
</head>

<body>
<header id="header">
        <table class="configTableCabecera">
            <tr>
                <th align="left" width="40px" ROWSPAN=3>
                <!-- <img src="{{public_path('img/LogoCompleto.png') }}" borde="0" width="102px" height="50px" /> -->
                </th>
                <th align="center"><span> Benemerita Sociedad Protectora de la Infancia</span></th>
            </tr>
            <tr>
                <th align="center"><span>Club Rotario Astillero</span></th>
            </tr>
            <tr>
                <th align="center"><span>GUAYAQUIL</span></th>
            </tr>

        </table>
    </header>
    
 
<table class="configTableCaberaAll configBorderItem configTextItem2 topCabecera" >
    <tr class="cabeceras" >
        <td>Nº registro</td>
        <td>Fecha de registro</td>
        <td>Descripcion de Desechos</td>
        <td>Responsable del área</td>
        <td>Departamento</td>
         
        <td>Kg.</td>
        
        
    </tr>
    @php
    $cont = 0;
    @endphp
    @for($i=0; $i < sizeof($lista) ; $i++) <tr>
        @php
        $cont = $i;
        $cont +=1;

        @endphp
        <td   > {{$cont}}</td>
        <td > {{ $lista[$i]->created_at }}</td>
               <td > {{ $lista[$i]->des_clasificacion_desechos_des  }}</td>
        <td > {{ $lista[$i]->responsable_apellido  }} {{ $lista[$i]->responsable_nombre  }}</td>
        <td > {{ $lista[$i]->departamento  }}</td>
        
        <td > {{ $lista[$i]->peso  }}</td>
        
       
       
        </tr>

        @endfor


</table>




<table style="position: fixed;bottom: 0px;">
    <thead>
        <tr>
            
        </tr>
    </thead>
</table>



</body>

</html>
