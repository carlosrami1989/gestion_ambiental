 

<body>
 
    
<div >{{ $titulo  }}</div>
<table  >
    <tr >
        <td>Nº registro</td>
        <td>Fecha de registro</td>
        <td>Descripcion de Desechos</td>
        <td>Responsable del área</td>
        <td>Departamento</td>
        <td>Registrado por : </td>
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
        <td   > {{ $lista[$i]->CirProNomPac  }}</td>
        <td > {{ $lista[$i]->des_clasificacion_desechos  }}</td>
        <td > {{ $lista[$i]->responsable_apellido  }} {{ $lista[$i]->responsable_nombre  }}</td>
        <td > {{ $lista[$i]->departamento  }}</td>
        <td > {{ $lista[$i]->responsable_apellido  }}</td>
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
