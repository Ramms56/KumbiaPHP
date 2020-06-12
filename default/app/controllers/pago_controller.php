<?php

/**
 * Carga del modelo Menus...
 */
Load::models('pago');

class PagoController extends AppController {

    /**
     * Obtiene una lista para paginar los menus
     */
    public function index($page = 1) {
        $pago = new Pago();
        $this->listPago = $pago->getpago($page);
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
        if (Input::hasPost('pago')) {
            /**
             * se le pasa al modelo por constructor los datos del form y ActiveRecord recoge esos datos
             * y los asocia al campo correspondiente siempre y cuando se utilice la convención
             * model.campo
             */
            $pago = new Pago(Input::post('pago'));
            //En caso que falle la operación de guardar
            if ($pago->create()) {
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
        $pago= new Pago();

        //se verifica si se ha enviado el formulario (submit)
        if (Input::hasPost('pago')) {

            if ($pago->update(Input::post('pago'))) {
                Flash::valid('Operación exitosa');
                //enrutando por defecto al index del controller
                return Router::redirect();
            } else {
                Flash::error('Falló Operación');
            }
        } else {
            //Aplicando la autocarga de objeto, para comenzar la edición
            $this->pago = $pago->find_by_id((int) $id);
        }
    }

    /**
     * Eliminar un menu
     * 
     * @param int $id (requerido)
     */
    public function del($id) {
        $pago = new Pago();
        if ($pago->delete((int) $id)) {
            Flash::valid('Operación exitosa');
        } else {
            Flash::error('Falló Operación');
        }

        //enrutando por defecto al index del controller
        return Router::redirect();
    }

}