<?php

namespace App\Http\ViewComposers;

use Illuminate\View\View;
use App\Repositories\UserRepository;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Redis;
use Illuminate\Support\Facades\Session;

class DocumentWorkflowComposer
{
    public function compose(View $view)
    {
        if (Redis::get("RedisGetMyDocument") == null) {
            $varTTL = 43200; // 12 Jam

            $varAPIWebToken = Session::get('SessionLogin');
            $SessionWorkerCareerInternal_RefID =  Session::get('SessionWorkerCareerInternal_RefID');

            if ($SessionWorkerCareerInternal_RefID != 0) {

                $CountDocumentWorkflowComposer = Cache::remember('CountDocumentWorkflowComposer', 480, function () use ($SessionWorkerCareerInternal_RefID, $varAPIWebToken) {

                    $varData = \App\Helpers\ZhtHelper\System\FrontEnd\Helper_APICall::setCallAPIGateway(
                        \App\Helpers\ZhtHelper\System\Helper_Environment::getUserSessionID_System(),
                        $varAPIWebToken,
                        'report.form.resume.master.getBusinessDocumentIssuanceDispositionCount',
                        'latest',
                        [
                            'parameter' => [
                                'recordID' => (int)$SessionWorkerCareerInternal_RefID
                            ]
                        ]
                    );

                    return $varData['data']['0']['document']['content']['dataCount'];
                });
            } else {
                $CountDocumentWorkflowComposer = 0;
            }

            //SET VALUE REDIS
            \App\Helpers\ZhtHelper\Cache\Helper_Redis::setValue(
                \App\Helpers\ZhtHelper\System\Helper_Environment::getUserSessionID_System(),
                "RedisGetMyDocument",
                $CountDocumentWorkflowComposer,
                $varTTL
            );

            $compact = [
                'CountDocumentWorkflowComposer' => $CountDocumentWorkflowComposer
            ];

            $view->with($compact);
        } else {

            $CountDocumentWorkflowComposer = \App\Helpers\ZhtHelper\Cache\Helper_Redis::getValue(
                \App\Helpers\ZhtHelper\System\Helper_Environment::getUserSessionID_System(),
                "RedisGetMyDocument"
            );

            $compact = [
                'CountDocumentWorkflowComposer' => $CountDocumentWorkflowComposer
            ];

            $view->with($compact);
        }
    }
}
