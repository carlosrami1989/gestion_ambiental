<?php

namespace App\Exports;

//use App\Models\User;
//use Maatwebsite\Excel\Concerns\FromCollection;
use Illuminate\Contracts\View\View;
use Maatwebsite\Excel\Concerns\FromView;

class UsersExport implements FromView
{
    /**
    * @return \Illuminate\Support\Collection
    */
    public $titulo;
    public $lista;

    public function __construct( $lista,$titulo)
    {    
        $this->lista = $lista;
       
        $this->titulo = $titulo;
       

    }

    public function view(): View
    {
        return view('reports.excel', [
            'lista' =>  $this->lista ,
              'titulo' =>$this->titulo ,
        ]);
    }
    public function startCell(): string
    {
        return 'B2';
    }
     
}
