<?php

class Horario extends ActiveRecord {

    /**
     * Retorna los menu para ser paginados
     *
     */
    public function getHorario($page, $ppage = 5) {
        
     
        return $this->paginate("page: $page", "per_page: $ppage");
    }

}