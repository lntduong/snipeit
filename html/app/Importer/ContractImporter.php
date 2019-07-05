<?php

namespace App\Importer;

use App\Models\Contracts;
use App\Models\Stores;
use App\Models\Company;
use App\Models\Location;
use App\Models\User;
use App\Models\Statuslabel;
/**
 * Create the contract if it does not exist.
 *
 * @author Diem.GTN
 */
class ContractImporter extends ItemImporter
{
    protected $defaultStatusLabelId;

    public function __construct($filename)
    {
        parent::__construct($filename);
        $this->defaultStatusLabelId = Statuslabel::first()->id;
    }

    protected function handle($row)
    {
        parent::handle($row);

        $this->createContractIfNotExists($row);
    }

    
    public function createContractIfNotExists(array $row)
    {
        $editingContract = false;
        $company = $this->findCsvMatch($row, "company");
        $company_contract = Company::where('name', $company)->first();
        if (!$company_contract) {
            $this->log("No Matching Company, Creating a new one");
            $company_contract = new Company;
            $company_contract->name = $company;
            $company_contract->save();
            $company_id = $company_contract->id;
        } else {
            $company_id = $company_contract->id;
        }

        $store = $this->findCsvMatch($row, "store");
        $store_contract = Stores::where('name', $store)
                                ->where('company_id', $company_id)
                                ->first();
        if (!$store_contract) {
            $this->log("No Matching Store, Creating a new one");
            $store_contract = new Stores;
            $store_contract->name = $store;
            $store_contract->company_id = $company_id;
            $store_contract->save();
            $this->item['store_id'] = $store_contract->id;
        } else {
            $this->item['store_id'] = $store_contract->id;
        }

        $this->item['name'] = $this->findCsvMatch($row, "contract_name");
        $contract = Contracts::where('store_id', $this->item['store_id'])
                        ->where('name', $this->item['name'])
                        ->first();
        if ($contract) {
            if (!$this->updating) {
                $this->logError($contract,'Contract ' . $this->item['name'] . ' already exists');
                return;
            }

            $this->log('Updating Contract');
            $editingContract = true;
        } else {
            $this->log("No Matching Contract, Creating a new one");
            $contract = new Contracts;
        }
        
        $location = $this->findCsvMatch($row, "location");
        $location_contract = Location::where('name', $location)->first();
        if (!$location_contract) {
            $this->log("No Matching Location, Creating a new one");
            $location_contract = new Location;
            $location_contract->name = $location;
            $location_contract->save();
            $this->item['location_id'] = $location_contract->id;
        } else {
            $this->item['location_id'] = $location_contract->id;
        }

        $contact_1 = $this->findCsvMatch($row, "contact_1");
        if ($contact_1!='') {
            $person_1 = User::where('username', $contact_1)
                                ->where('company_id', $company_id)
                                ->first();
            if (!$person_1) {
                $this->logError($person_1,$person_1->username . ' no exists');
                return;
            } else {
                $this->item['contact_id_1'] = $person_1->id;
            }
        } else {
            $this->item['contact_id_1'] = '';
        }

        $contact_2 = $this->findCsvMatch($row, "contact_2");
        if ($contact_2!='') {
            $person_2 = User::where('username', $contact_1)
                                ->where('company_id', $company_id)
                                ->first();
            if (!$person_2) {
                $this->logError($person_1,$person_2->username . ' no exists');
                return;
            } else {
                $this->item['contact_id_2'] = $person_2->id;
            }
        } else {
            $this->item['contact_id_2'] = '';
        }

        $this->item['terms_and_conditions'] = $this->findCsvMatch($row, "terms_and_conditions");
        $this->item['start_date'] = $this->findCsvMatch($row, "start_date");
        $this->item['end_date'] = $this->findCsvMatch($row, "end_date");
        $this->item['billing_date'] = $this->findCsvMatch($row, "billing_date");
        $this->item['end_date'] = $this->findCsvMatch($row, "end_date");
        $this->item['notes'] = $this->findCsvMatch($row, "notes");
        
        $item = $this->sanitizeItemForStoring($contract,$editingContract);
        if ($editingContract) {
            $contract->update($item);
        } else {
            $contract->fill($item);
        }

        if ($contract->save()) {
            $this->log('Contract ' . $this->item['name'] . ' was created'); 
            return;
        }

        $this->logError($contract, 'Contract "' . $this->item['name'].'"');
    }
}