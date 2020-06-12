<?php

class Participante extends ActiveRecord {

    /**
     * Retorna los menu para ser paginados
     *
     */
    public function getParticipante($page, $ppage = 5) {
        
     
        return $this->paginate("page: $page", "per_page: $ppage");
    }

}