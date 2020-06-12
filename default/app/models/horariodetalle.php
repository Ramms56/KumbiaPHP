<?php

class Horariodetalle extends ActiveRecord {

    /**
     * Retorna los menu para ser paginados
     *
     */
    public function getHorariodetalle($page, $ppage = 5) {
        
     
        return $this->paginate("page: $page", "per_page: $ppage");
    }

}