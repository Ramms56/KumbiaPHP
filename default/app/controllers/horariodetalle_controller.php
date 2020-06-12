<?php

/**
 * Carga del modelo Menus...
 */
Load::models('horariodetalle');

class HorariodetalleController extends AppController {

    /**
     * Obtiene una lista para paginar los menus
     */
    public function index($page = 1) {
        $horariodetalle = new Horariodetalle();
        $this->listHorariodetalle = $horariodetalle->gethorariodetalle($page);
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
        if (Input::hasPost('horariodetalle')) {
            /**
             * se le pasa al modelo por constructor los datos del form y ActiveRecord recoge esos datos
             * y los asocia al campo correspondiente siempre y cuando se utilice la convención
             * model.campo
             */
            $horariodetalle = new Horariodetalle(Input::post('horariodetalle'));
            //En caso que falle la operación de guardar
            if ($horariodetalle->create()) {
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
        $horariodetalle= new Horariodetalle();

        //se verifica si se ha enviado el formulario (submit)
        if (Input::hasPost('horariodetalle')) {

            if ($horariodetalle->update(Input::post('horariodetalle'))) {
                Flash::valid('Operación exitosa');
                //enrutando por defecto al index del controller
                return Router::redirect();
            } else {
                Flash::error('Falló Operación');
            }
        } else {
            //Aplicando la autocarga de objeto, para comenzar la edición
            $this->horariodetalle = $horariodetalle->find_by_id((int) $id);
        }
    }

    /**
     * Eliminar un menu
     * 
     * @param int $id (requerido)
     */
    public function del($id) {
        $horariodetalle = new Horariodetalle();
        if ($horariodetalle->delete((int) $id)) {
            Flash::valid('Operación exitosa');
        } else {
            Flash::error('Falló Operación');
        }

        //enrutando por defecto al index del controller
        return Router::redirect();
    }

}