<!DOCTYPE html>
 

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    
    <meta http-equiv="Content-type" content="text/html; charset=utf-8" />
    <title>{{ config('app.name', 'BSPI') }}</title>

    <!-- Icono de la Pestaña -->
    <link rel="shortcut icon" href="{{ asset('img/icono.png') }}">

    <!-- Plantilla General de los CSS -->
    <!-- <link rel="stylesheet" href="{{ asset('css/plantilla.css') }}"> -->

    <!-- Evitar ataques X-CSRF-TOKEN -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <!-- Fonts -->
    

    <!-- Styles -->
    <!-- <link rel="stylesheet" href="{{ asset('css/app.css') }}"> -->

    <!-- Scripts -->
 
</head>

<body >
    

    <!-- Main Sidebar Container -->
     
    <div id="app" >
    
    <v-app  >
    <home :user="{{ json_encode(Auth::user()) }}"></home>
    </v-app>
 
   
    </div>
 

    </body>
    <!-- App JS de Vue -->
    <script src="{{ asset('js/app.js') }}"></script>
    <!-- Plantilla General de los JS -->
    <script src="{{ asset('js/plantilla.js') }}"></script>
    

    <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900" rel="stylesheet">
 
<link rel="stylesheet" href="//cdn.materialdesignicons.com/5.4.55/css/materialdesignicons.min.css">


</html>
