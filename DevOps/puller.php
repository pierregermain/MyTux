<?php
// git pull and drupal cr all

$branch = 'branchname';

$puller = new Puller($branch);

$puller->run();

/**
 * Class Puller
 */
class Puller
{
    /**
     * @var string
     */
    private $path_log = '/var/www/projectname/sites/default/files/';

    /**
     * @var string
     */
    private $file_name = 'puller.log';

    /**
     * @var string
     */
    private $log_file = '';

    /**
     * @var array
     */
    private $log = [];

    /**
     * @var string
     */
    private $remote = '';

    /**
     * @var string
     */
    private $branch = '';

    /**
     * @var array
     */
    private $actions = [];


    /**
     * Puller constructor.
     * @param string $branch
     * @param string $remote
     */
    public function __construct($branch = 'master', $remote = 'origin')
    {

        $this->setPhpSettings();

        $this->configLog();

        $this->configRepo($branch, $remote);

        $this->setActions();

    }

    /**
     * setPhpSettings
     */
    private function setPhpSettings()
    {

        error_reporting(E_ALL);

        ini_set('display_errors', '1');

        set_time_limit(0);

    }

    /**
     * Set log config.
     */
    private function configLog()
    {

        $this->log_file = $this->path_log . $this->file_name;

    }

    /**
     * @param $branch
     * @param $remote
     */
    private function configRepo($branch, $remote)
    {

        $this->branch = $branch;

        $this->remote = $remote;

    }

    /**
     * @return date
     *
     */
    public function getTime()
    {

        $now = new DateTime('NOW', new DateTimeZone('America/Mexico_City'));

        return $now->format('F j, Y, g:i a');

    }

    /**
     * @param string $msg
     * @param string $status
     */
    public function addEntryLog($msg, $status = "Message" )
    {

        $log_entry = $this->getTime() . ' ' . $status . ' ' . $msg;

        file_put_contents($this->log_file, $log_entry, FILE_APPEND);

        $this->log[] = $log_entry;

    }

    /**
     * Run Puller.
     */
    public function run()
    {

//        try {
//            //$payload = json_decode($HTTP_RAW_POST_DATA);
//        }
//        catch(Exception $e) {
//            //log the error
//            $this->addEntryLog($payload, 'Error');
//            exit(0);
//        }

//        if ($payload->ref && $payload->ref == $this->branch ) {
//            //for debugging
//            $this->addEntryLog($payload->ref, 'Debugging');
//
//        }

        $this->runActions();

        $this->printLog();

    }

    /**
     * Run actions.
     */
    protected function runActions()
    {

        foreach ($this->actions as $action) {

            $log_msg = shell_exec($action);

            $this->addEntryLog($log_msg);

        }

    }

    /**
     * Set actions to run.
     */
    protected function setActions()
    {

        $this->actions = [
            'whoami; cd /var/www/projectname', //user and positioning
            'sudo -u ubuntu git pull ' . $this->remote . ' ' . $this->branch, //git pull
            'drupal cr all' // clear caches
        ];

    }

    /**
     * Print all Log messages.
     */
    public function printLog()
    {

        foreach ($this->log as $log_entry) {
            echo $log_entry . '<br>';
        }

    }

}
