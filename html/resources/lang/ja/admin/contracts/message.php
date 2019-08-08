<?php

return array(

    'does_not_exist' => 'Contract does not exist.',
    'assoc_users'	 => 'This Contract is currently associated with at least one user and cannot be deleted. Please update your users to no longer reference this Contract and try again. ',
    'assoc_assets'	 => 'This Contract is currently associated with at least one asset and cannot be deleted. Please update your assets to no longer reference this Contract and try again. ',
    'assoc_child_loc'	 => 'This Contract is currently the parent of at least one child Contract and cannot be deleted. Please update your Contracts to no longer reference this Contract and try again. ',


    'create' => array(
        'error'         => 'Contract was not created, please try again.',
        'success'       => 'Contract created successfully.',
        'nameduplicate' => 'Contract Name duplicated.'
    ),

    'update' => array(
        'error'   => 'Contract was not updated, please try again',
        'success' => 'Contract updated successfully.'
    ),

    'delete' => array(
        'confirm'   	=> 'Are you sure you wish to delete this Contract?',
        'error'   => 'There was an issue deleting the Contract. Please try again.',
        'success' => 'The Contract was deleted successfully.'
    ),

    'require_add_contract'  => 'Please add Assets for Contract',

    'success' => 'Success:', 
    'create_contract_assets'=> 'Contract Assets created successfully.',

    'fail' => 'Failed:',
    'asset_required' => 'Asset required.',

    'delete_contract_assets' => 'The asset was deleted from contract successfully.'


);
