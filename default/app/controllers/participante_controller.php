<?php

/**
 * Carga del modelo Menus...
 */
Load::models('participante');

class ParticipanteController extends AppController {

    /**
     * Obtiene una lista para paginar los menus
     */
    public function index($page = 1) {
        $participante = new Participante();
        $this->listParticipante = $participante->getparticipante($page);
    }

    /**
     * Crea un Registro
     */
    public function create() {
       // print_r($_POST);exit();
        /**
         * Se verifica si el usuario envio el form (submit) y si ademas 
         * dentro del array POST existe uno llamado "menus"
         * el cual aplica la autocarga de objeto para guardar los 
         * datos enviado por POST utilizando autocarga de objeto
         */
        if (Input::hasPost('participante')) {
            /**
             * se le pasa al modelo por constructor los datos del form y ActiveRecord recoge esos datos
             * y los asocia al campo correspondiente siempre y cuando se utilice la convención
             * model.campo
             */
            $participante = new Participante(Input::post('participante'));
            //En caso que falle la operación de guardar
            if ($participante->create()) {
                Flash::valid('Operación exitosa');
                //Eliminamos el POST, si no queremos que se vean en el form
                Input::delete();
                return;
            } else {
                Flash::error('Falló Operación');
            }
        }
    }

    /**
     * Edita un Registro
     *
     * @param int $id (requerido)
     */
    public function edit($id) {
        $participante= new Participante();

        //se verifica si se ha enviado el formulario (submit)
        if (Input::hasPost('participante')) {

            if ($participante->update(Input::post('participante'))) {
                Flash::valid('Operación exitosa');
                //enrutando por defecto al index del controller
                return Router::redirect();
            } else {
                Flash::error('Falló Operación');
            }
        } else {
            //Aplicando la autocarga de objeto, para comenzar la edición
            $this->participante = $participante->find_by_id((int) $id);
        }
    }

    /**
     * Eliminar un menu
     * 
     * @param int $id (requerido)
     */
    public function del($id) {
        $participante = new Participante();
        if ($participante->delete((int) $id)) {
            Flash::valid('Operación exitosa');
        } else {
            Flash::error('Falló Operación');
        }

        //enrutando por defecto al index del controller
        return Router::redirect();
    }


    public function inicio() 
    {
    
    }

 }





?>