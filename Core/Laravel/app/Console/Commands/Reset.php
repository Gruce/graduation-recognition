<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Artisan;

class reset extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'reset';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Reset Database & Seeding';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        Artisan::call('migrate:reset');
        $this->info('Migrate Reseted.');
        Artisan::call('migrate');
        $this->info('Migrated.');
        Artisan::call('db:seed');
        $this->info('Database seeded.');
        return 0;
    }
}
