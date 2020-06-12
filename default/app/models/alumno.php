<?php

class Actividad extends ActiveRecord {

    /**
     * Retorna los menu para ser paginados
     *
     */
    public function getAlumno($page, $ppage = 5) {
        
     
        return $this->paginate("page: $page", "per_page: $ppage");
    }

}