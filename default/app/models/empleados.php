<?php

class Empleados extends ActiveRecord {

    /**
     * Retorna los menu para ser paginados
     *
     */
    public function getEmpleados($page, $ppage = 5) {
        
      return $this->paginate("page: $page", "per_page: $ppage", 'order: id desc');
    }

}



//tabla cargo tiene idcargo
//tabla empleado tiene cargo
