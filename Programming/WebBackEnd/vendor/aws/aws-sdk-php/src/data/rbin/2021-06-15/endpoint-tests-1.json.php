<?php
// This file was auto-generated from sdk-root/src/data/rbin/2021-06-15/endpoint-tests-1.json
return [ 'testCases' => [ [ 'documentation' => 'For region ap-south-2 with FIPS enabled and DualStack enabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin-fips.ap-south-2.api.aws', ], ], 'params' => [ 'Region' => 'ap-south-2', 'UseDualStack' => true, 'UseFIPS' => true, ], ], [ 'documentation' => 'For region ap-south-2 with FIPS enabled and DualStack disabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin-fips.ap-south-2.amazonaws.com', ], ], 'params' => [ 'Region' => 'ap-south-2', 'UseDualStack' => false, 'UseFIPS' => true, ], ], [ 'documentation' => 'For region ap-south-2 with FIPS disabled and DualStack enabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin.ap-south-2.api.aws', ], ], 'params' => [ 'Region' => 'ap-south-2', 'UseDualStack' => true, 'UseFIPS' => false, ], ], [ 'documentation' => 'For region ap-south-2 with FIPS disabled and DualStack disabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin.ap-south-2.amazonaws.com', ], ], 'params' => [ 'Region' => 'ap-south-2', 'UseDualStack' => false, 'UseFIPS' => false, ], ], [ 'documentation' => 'For region ap-south-1 with FIPS enabled and DualStack enabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin-fips.ap-south-1.api.aws', ], ], 'params' => [ 'Region' => 'ap-south-1', 'UseDualStack' => true, 'UseFIPS' => true, ], ], [ 'documentation' => 'For region ap-south-1 with FIPS enabled and DualStack disabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin-fips.ap-south-1.amazonaws.com', ], ], 'params' => [ 'Region' => 'ap-south-1', 'UseDualStack' => false, 'UseFIPS' => true, ], ], [ 'documentation' => 'For region ap-south-1 with FIPS disabled and DualStack enabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin.ap-south-1.api.aws', ], ], 'params' => [ 'Region' => 'ap-south-1', 'UseDualStack' => true, 'UseFIPS' => false, ], ], [ 'documentation' => 'For region ap-south-1 with FIPS disabled and DualStack disabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin.ap-south-1.amazonaws.com', ], ], 'params' => [ 'Region' => 'ap-south-1', 'UseDualStack' => false, 'UseFIPS' => false, ], ], [ 'documentation' => 'For region eu-south-1 with FIPS enabled and DualStack enabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin-fips.eu-south-1.api.aws', ], ], 'params' => [ 'Region' => 'eu-south-1', 'UseDualStack' => true, 'UseFIPS' => true, ], ], [ 'documentation' => 'For region eu-south-1 with FIPS enabled and DualStack disabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin-fips.eu-south-1.amazonaws.com', ], ], 'params' => [ 'Region' => 'eu-south-1', 'UseDualStack' => false, 'UseFIPS' => true, ], ], [ 'documentation' => 'For region eu-south-1 with FIPS disabled and DualStack enabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin.eu-south-1.api.aws', ], ], 'params' => [ 'Region' => 'eu-south-1', 'UseDualStack' => true, 'UseFIPS' => false, ], ], [ 'documentation' => 'For region eu-south-1 with FIPS disabled and DualStack disabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin.eu-south-1.amazonaws.com', ], ], 'params' => [ 'Region' => 'eu-south-1', 'UseDualStack' => false, 'UseFIPS' => false, ], ], [ 'documentation' => 'For region eu-south-2 with FIPS enabled and DualStack enabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin-fips.eu-south-2.api.aws', ], ], 'params' => [ 'Region' => 'eu-south-2', 'UseDualStack' => true, 'UseFIPS' => true, ], ], [ 'documentation' => 'For region eu-south-2 with FIPS enabled and DualStack disabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin-fips.eu-south-2.amazonaws.com', ], ], 'params' => [ 'Region' => 'eu-south-2', 'UseDualStack' => false, 'UseFIPS' => true, ], ], [ 'documentation' => 'For region eu-south-2 with FIPS disabled and DualStack enabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin.eu-south-2.api.aws', ], ], 'params' => [ 'Region' => 'eu-south-2', 'UseDualStack' => true, 'UseFIPS' => false, ], ], [ 'documentation' => 'For region eu-south-2 with FIPS disabled and DualStack disabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin.eu-south-2.amazonaws.com', ], ], 'params' => [ 'Region' => 'eu-south-2', 'UseDualStack' => false, 'UseFIPS' => false, ], ], [ 'documentation' => 'For region us-gov-east-1 with FIPS enabled and DualStack enabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin-fips.us-gov-east-1.api.aws', ], ], 'params' => [ 'Region' => 'us-gov-east-1', 'UseDualStack' => true, 'UseFIPS' => true, ], ], [ 'documentation' => 'For region us-gov-east-1 with FIPS enabled and DualStack disabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin-fips.us-gov-east-1.amazonaws.com', ], ], 'params' => [ 'Region' => 'us-gov-east-1', 'UseDualStack' => false, 'UseFIPS' => true, ], ], [ 'documentation' => 'For region us-gov-east-1 with FIPS disabled and DualStack enabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin.us-gov-east-1.api.aws', ], ], 'params' => [ 'Region' => 'us-gov-east-1', 'UseDualStack' => true, 'UseFIPS' => false, ], ], [ 'documentation' => 'For region us-gov-east-1 with FIPS disabled and DualStack disabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin.us-gov-east-1.amazonaws.com', ], ], 'params' => [ 'Region' => 'us-gov-east-1', 'UseDualStack' => false, 'UseFIPS' => false, ], ], [ 'documentation' => 'For region me-central-1 with FIPS enabled and DualStack enabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin-fips.me-central-1.api.aws', ], ], 'params' => [ 'Region' => 'me-central-1', 'UseDualStack' => true, 'UseFIPS' => true, ], ], [ 'documentation' => 'For region me-central-1 with FIPS enabled and DualStack disabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin-fips.me-central-1.amazonaws.com', ], ], 'params' => [ 'Region' => 'me-central-1', 'UseDualStack' => false, 'UseFIPS' => true, ], ], [ 'documentation' => 'For region me-central-1 with FIPS disabled and DualStack enabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin.me-central-1.api.aws', ], ], 'params' => [ 'Region' => 'me-central-1', 'UseDualStack' => true, 'UseFIPS' => false, ], ], [ 'documentation' => 'For region me-central-1 with FIPS disabled and DualStack disabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin.me-central-1.amazonaws.com', ], ], 'params' => [ 'Region' => 'me-central-1', 'UseDualStack' => false, 'UseFIPS' => false, ], ], [ 'documentation' => 'For region ca-central-1 with FIPS enabled and DualStack enabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin-fips.ca-central-1.api.aws', ], ], 'params' => [ 'Region' => 'ca-central-1', 'UseDualStack' => true, 'UseFIPS' => true, ], ], [ 'documentation' => 'For region ca-central-1 with FIPS enabled and DualStack disabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin-fips.ca-central-1.amazonaws.com', ], ], 'params' => [ 'Region' => 'ca-central-1', 'UseDualStack' => false, 'UseFIPS' => true, ], ], [ 'documentation' => 'For region ca-central-1 with FIPS disabled and DualStack enabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin.ca-central-1.api.aws', ], ], 'params' => [ 'Region' => 'ca-central-1', 'UseDualStack' => true, 'UseFIPS' => false, ], ], [ 'documentation' => 'For region ca-central-1 with FIPS disabled and DualStack disabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin.ca-central-1.amazonaws.com', ], ], 'params' => [ 'Region' => 'ca-central-1', 'UseDualStack' => false, 'UseFIPS' => false, ], ], [ 'documentation' => 'For region eu-central-1 with FIPS enabled and DualStack enabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin-fips.eu-central-1.api.aws', ], ], 'params' => [ 'Region' => 'eu-central-1', 'UseDualStack' => true, 'UseFIPS' => true, ], ], [ 'documentation' => 'For region eu-central-1 with FIPS enabled and DualStack disabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin-fips.eu-central-1.amazonaws.com', ], ], 'params' => [ 'Region' => 'eu-central-1', 'UseDualStack' => false, 'UseFIPS' => true, ], ], [ 'documentation' => 'For region eu-central-1 with FIPS disabled and DualStack enabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin.eu-central-1.api.aws', ], ], 'params' => [ 'Region' => 'eu-central-1', 'UseDualStack' => true, 'UseFIPS' => false, ], ], [ 'documentation' => 'For region eu-central-1 with FIPS disabled and DualStack disabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin.eu-central-1.amazonaws.com', ], ], 'params' => [ 'Region' => 'eu-central-1', 'UseDualStack' => false, 'UseFIPS' => false, ], ], [ 'documentation' => 'For region eu-central-2 with FIPS enabled and DualStack enabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin-fips.eu-central-2.api.aws', ], ], 'params' => [ 'Region' => 'eu-central-2', 'UseDualStack' => true, 'UseFIPS' => true, ], ], [ 'documentation' => 'For region eu-central-2 with FIPS enabled and DualStack disabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin-fips.eu-central-2.amazonaws.com', ], ], 'params' => [ 'Region' => 'eu-central-2', 'UseDualStack' => false, 'UseFIPS' => true, ], ], [ 'documentation' => 'For region eu-central-2 with FIPS disabled and DualStack enabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin.eu-central-2.api.aws', ], ], 'params' => [ 'Region' => 'eu-central-2', 'UseDualStack' => true, 'UseFIPS' => false, ], ], [ 'documentation' => 'For region eu-central-2 with FIPS disabled and DualStack disabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin.eu-central-2.amazonaws.com', ], ], 'params' => [ 'Region' => 'eu-central-2', 'UseDualStack' => false, 'UseFIPS' => false, ], ], [ 'documentation' => 'For region us-west-1 with FIPS enabled and DualStack enabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin-fips.us-west-1.api.aws', ], ], 'params' => [ 'Region' => 'us-west-1', 'UseDualStack' => true, 'UseFIPS' => true, ], ], [ 'documentation' => 'For region us-west-1 with FIPS enabled and DualStack disabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin-fips.us-west-1.amazonaws.com', ], ], 'params' => [ 'Region' => 'us-west-1', 'UseDualStack' => false, 'UseFIPS' => true, ], ], [ 'documentation' => 'For region us-west-1 with FIPS disabled and DualStack enabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin.us-west-1.api.aws', ], ], 'params' => [ 'Region' => 'us-west-1', 'UseDualStack' => true, 'UseFIPS' => false, ], ], [ 'documentation' => 'For region us-west-1 with FIPS disabled and DualStack disabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin.us-west-1.amazonaws.com', ], ], 'params' => [ 'Region' => 'us-west-1', 'UseDualStack' => false, 'UseFIPS' => false, ], ], [ 'documentation' => 'For region us-west-2 with FIPS enabled and DualStack enabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin-fips.us-west-2.api.aws', ], ], 'params' => [ 'Region' => 'us-west-2', 'UseDualStack' => true, 'UseFIPS' => true, ], ], [ 'documentation' => 'For region us-west-2 with FIPS enabled and DualStack disabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin-fips.us-west-2.amazonaws.com', ], ], 'params' => [ 'Region' => 'us-west-2', 'UseDualStack' => false, 'UseFIPS' => true, ], ], [ 'documentation' => 'For region us-west-2 with FIPS disabled and DualStack enabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin.us-west-2.api.aws', ], ], 'params' => [ 'Region' => 'us-west-2', 'UseDualStack' => true, 'UseFIPS' => false, ], ], [ 'documentation' => 'For region us-west-2 with FIPS disabled and DualStack disabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin.us-west-2.amazonaws.com', ], ], 'params' => [ 'Region' => 'us-west-2', 'UseDualStack' => false, 'UseFIPS' => false, ], ], [ 'documentation' => 'For region af-south-1 with FIPS enabled and DualStack enabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin-fips.af-south-1.api.aws', ], ], 'params' => [ 'Region' => 'af-south-1', 'UseDualStack' => true, 'UseFIPS' => true, ], ], [ 'documentation' => 'For region af-south-1 with FIPS enabled and DualStack disabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin-fips.af-south-1.amazonaws.com', ], ], 'params' => [ 'Region' => 'af-south-1', 'UseDualStack' => false, 'UseFIPS' => true, ], ], [ 'documentation' => 'For region af-south-1 with FIPS disabled and DualStack enabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin.af-south-1.api.aws', ], ], 'params' => [ 'Region' => 'af-south-1', 'UseDualStack' => true, 'UseFIPS' => false, ], ], [ 'documentation' => 'For region af-south-1 with FIPS disabled and DualStack disabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin.af-south-1.amazonaws.com', ], ], 'params' => [ 'Region' => 'af-south-1', 'UseDualStack' => false, 'UseFIPS' => false, ], ], [ 'documentation' => 'For region eu-north-1 with FIPS enabled and DualStack enabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin-fips.eu-north-1.api.aws', ], ], 'params' => [ 'Region' => 'eu-north-1', 'UseDualStack' => true, 'UseFIPS' => true, ], ], [ 'documentation' => 'For region eu-north-1 with FIPS enabled and DualStack disabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin-fips.eu-north-1.amazonaws.com', ], ], 'params' => [ 'Region' => 'eu-north-1', 'UseDualStack' => false, 'UseFIPS' => true, ], ], [ 'documentation' => 'For region eu-north-1 with FIPS disabled and DualStack enabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin.eu-north-1.api.aws', ], ], 'params' => [ 'Region' => 'eu-north-1', 'UseDualStack' => true, 'UseFIPS' => false, ], ], [ 'documentation' => 'For region eu-north-1 with FIPS disabled and DualStack disabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin.eu-north-1.amazonaws.com', ], ], 'params' => [ 'Region' => 'eu-north-1', 'UseDualStack' => false, 'UseFIPS' => false, ], ], [ 'documentation' => 'For region eu-west-3 with FIPS enabled and DualStack enabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin-fips.eu-west-3.api.aws', ], ], 'params' => [ 'Region' => 'eu-west-3', 'UseDualStack' => true, 'UseFIPS' => true, ], ], [ 'documentation' => 'For region eu-west-3 with FIPS enabled and DualStack disabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin-fips.eu-west-3.amazonaws.com', ], ], 'params' => [ 'Region' => 'eu-west-3', 'UseDualStack' => false, 'UseFIPS' => true, ], ], [ 'documentation' => 'For region eu-west-3 with FIPS disabled and DualStack enabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin.eu-west-3.api.aws', ], ], 'params' => [ 'Region' => 'eu-west-3', 'UseDualStack' => true, 'UseFIPS' => false, ], ], [ 'documentation' => 'For region eu-west-3 with FIPS disabled and DualStack disabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin.eu-west-3.amazonaws.com', ], ], 'params' => [ 'Region' => 'eu-west-3', 'UseDualStack' => false, 'UseFIPS' => false, ], ], [ 'documentation' => 'For region eu-west-2 with FIPS enabled and DualStack enabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin-fips.eu-west-2.api.aws', ], ], 'params' => [ 'Region' => 'eu-west-2', 'UseDualStack' => true, 'UseFIPS' => true, ], ], [ 'documentation' => 'For region eu-west-2 with FIPS enabled and DualStack disabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin-fips.eu-west-2.amazonaws.com', ], ], 'params' => [ 'Region' => 'eu-west-2', 'UseDualStack' => false, 'UseFIPS' => true, ], ], [ 'documentation' => 'For region eu-west-2 with FIPS disabled and DualStack enabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin.eu-west-2.api.aws', ], ], 'params' => [ 'Region' => 'eu-west-2', 'UseDualStack' => true, 'UseFIPS' => false, ], ], [ 'documentation' => 'For region eu-west-2 with FIPS disabled and DualStack disabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin.eu-west-2.amazonaws.com', ], ], 'params' => [ 'Region' => 'eu-west-2', 'UseDualStack' => false, 'UseFIPS' => false, ], ], [ 'documentation' => 'For region eu-west-1 with FIPS enabled and DualStack enabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin-fips.eu-west-1.api.aws', ], ], 'params' => [ 'Region' => 'eu-west-1', 'UseDualStack' => true, 'UseFIPS' => true, ], ], [ 'documentation' => 'For region eu-west-1 with FIPS enabled and DualStack disabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin-fips.eu-west-1.amazonaws.com', ], ], 'params' => [ 'Region' => 'eu-west-1', 'UseDualStack' => false, 'UseFIPS' => true, ], ], [ 'documentation' => 'For region eu-west-1 with FIPS disabled and DualStack enabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin.eu-west-1.api.aws', ], ], 'params' => [ 'Region' => 'eu-west-1', 'UseDualStack' => true, 'UseFIPS' => false, ], ], [ 'documentation' => 'For region eu-west-1 with FIPS disabled and DualStack disabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin.eu-west-1.amazonaws.com', ], ], 'params' => [ 'Region' => 'eu-west-1', 'UseDualStack' => false, 'UseFIPS' => false, ], ], [ 'documentation' => 'For region ap-northeast-3 with FIPS enabled and DualStack enabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin-fips.ap-northeast-3.api.aws', ], ], 'params' => [ 'Region' => 'ap-northeast-3', 'UseDualStack' => true, 'UseFIPS' => true, ], ], [ 'documentation' => 'For region ap-northeast-3 with FIPS enabled and DualStack disabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin-fips.ap-northeast-3.amazonaws.com', ], ], 'params' => [ 'Region' => 'ap-northeast-3', 'UseDualStack' => false, 'UseFIPS' => true, ], ], [ 'documentation' => 'For region ap-northeast-3 with FIPS disabled and DualStack enabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin.ap-northeast-3.api.aws', ], ], 'params' => [ 'Region' => 'ap-northeast-3', 'UseDualStack' => true, 'UseFIPS' => false, ], ], [ 'documentation' => 'For region ap-northeast-3 with FIPS disabled and DualStack disabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin.ap-northeast-3.amazonaws.com', ], ], 'params' => [ 'Region' => 'ap-northeast-3', 'UseDualStack' => false, 'UseFIPS' => false, ], ], [ 'documentation' => 'For region ap-northeast-2 with FIPS enabled and DualStack enabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin-fips.ap-northeast-2.api.aws', ], ], 'params' => [ 'Region' => 'ap-northeast-2', 'UseDualStack' => true, 'UseFIPS' => true, ], ], [ 'documentation' => 'For region ap-northeast-2 with FIPS enabled and DualStack disabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin-fips.ap-northeast-2.amazonaws.com', ], ], 'params' => [ 'Region' => 'ap-northeast-2', 'UseDualStack' => false, 'UseFIPS' => true, ], ], [ 'documentation' => 'For region ap-northeast-2 with FIPS disabled and DualStack enabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin.ap-northeast-2.api.aws', ], ], 'params' => [ 'Region' => 'ap-northeast-2', 'UseDualStack' => true, 'UseFIPS' => false, ], ], [ 'documentation' => 'For region ap-northeast-2 with FIPS disabled and DualStack disabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin.ap-northeast-2.amazonaws.com', ], ], 'params' => [ 'Region' => 'ap-northeast-2', 'UseDualStack' => false, 'UseFIPS' => false, ], ], [ 'documentation' => 'For region ap-northeast-1 with FIPS enabled and DualStack enabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin-fips.ap-northeast-1.api.aws', ], ], 'params' => [ 'Region' => 'ap-northeast-1', 'UseDualStack' => true, 'UseFIPS' => true, ], ], [ 'documentation' => 'For region ap-northeast-1 with FIPS enabled and DualStack disabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin-fips.ap-northeast-1.amazonaws.com', ], ], 'params' => [ 'Region' => 'ap-northeast-1', 'UseDualStack' => false, 'UseFIPS' => true, ], ], [ 'documentation' => 'For region ap-northeast-1 with FIPS disabled and DualStack enabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin.ap-northeast-1.api.aws', ], ], 'params' => [ 'Region' => 'ap-northeast-1', 'UseDualStack' => true, 'UseFIPS' => false, ], ], [ 'documentation' => 'For region ap-northeast-1 with FIPS disabled and DualStack disabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin.ap-northeast-1.amazonaws.com', ], ], 'params' => [ 'Region' => 'ap-northeast-1', 'UseDualStack' => false, 'UseFIPS' => false, ], ], [ 'documentation' => 'For region me-south-1 with FIPS enabled and DualStack enabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin-fips.me-south-1.api.aws', ], ], 'params' => [ 'Region' => 'me-south-1', 'UseDualStack' => true, 'UseFIPS' => true, ], ], [ 'documentation' => 'For region me-south-1 with FIPS enabled and DualStack disabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin-fips.me-south-1.amazonaws.com', ], ], 'params' => [ 'Region' => 'me-south-1', 'UseDualStack' => false, 'UseFIPS' => true, ], ], [ 'documentation' => 'For region me-south-1 with FIPS disabled and DualStack enabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin.me-south-1.api.aws', ], ], 'params' => [ 'Region' => 'me-south-1', 'UseDualStack' => true, 'UseFIPS' => false, ], ], [ 'documentation' => 'For region me-south-1 with FIPS disabled and DualStack disabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin.me-south-1.amazonaws.com', ], ], 'params' => [ 'Region' => 'me-south-1', 'UseDualStack' => false, 'UseFIPS' => false, ], ], [ 'documentation' => 'For region sa-east-1 with FIPS enabled and DualStack enabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin-fips.sa-east-1.api.aws', ], ], 'params' => [ 'Region' => 'sa-east-1', 'UseDualStack' => true, 'UseFIPS' => true, ], ], [ 'documentation' => 'For region sa-east-1 with FIPS enabled and DualStack disabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin-fips.sa-east-1.amazonaws.com', ], ], 'params' => [ 'Region' => 'sa-east-1', 'UseDualStack' => false, 'UseFIPS' => true, ], ], [ 'documentation' => 'For region sa-east-1 with FIPS disabled and DualStack enabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin.sa-east-1.api.aws', ], ], 'params' => [ 'Region' => 'sa-east-1', 'UseDualStack' => true, 'UseFIPS' => false, ], ], [ 'documentation' => 'For region sa-east-1 with FIPS disabled and DualStack disabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin.sa-east-1.amazonaws.com', ], ], 'params' => [ 'Region' => 'sa-east-1', 'UseDualStack' => false, 'UseFIPS' => false, ], ], [ 'documentation' => 'For region ap-east-1 with FIPS enabled and DualStack enabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin-fips.ap-east-1.api.aws', ], ], 'params' => [ 'Region' => 'ap-east-1', 'UseDualStack' => true, 'UseFIPS' => true, ], ], [ 'documentation' => 'For region ap-east-1 with FIPS enabled and DualStack disabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin-fips.ap-east-1.amazonaws.com', ], ], 'params' => [ 'Region' => 'ap-east-1', 'UseDualStack' => false, 'UseFIPS' => true, ], ], [ 'documentation' => 'For region ap-east-1 with FIPS disabled and DualStack enabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin.ap-east-1.api.aws', ], ], 'params' => [ 'Region' => 'ap-east-1', 'UseDualStack' => true, 'UseFIPS' => false, ], ], [ 'documentation' => 'For region ap-east-1 with FIPS disabled and DualStack disabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin.ap-east-1.amazonaws.com', ], ], 'params' => [ 'Region' => 'ap-east-1', 'UseDualStack' => false, 'UseFIPS' => false, ], ], [ 'documentation' => 'For region cn-north-1 with FIPS enabled and DualStack enabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin-fips.cn-north-1.api.amazonwebservices.com.cn', ], ], 'params' => [ 'Region' => 'cn-north-1', 'UseDualStack' => true, 'UseFIPS' => true, ], ], [ 'documentation' => 'For region cn-north-1 with FIPS enabled and DualStack disabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin-fips.cn-north-1.amazonaws.com.cn', ], ], 'params' => [ 'Region' => 'cn-north-1', 'UseDualStack' => false, 'UseFIPS' => true, ], ], [ 'documentation' => 'For region cn-north-1 with FIPS disabled and DualStack enabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin.cn-north-1.api.amazonwebservices.com.cn', ], ], 'params' => [ 'Region' => 'cn-north-1', 'UseDualStack' => true, 'UseFIPS' => false, ], ], [ 'documentation' => 'For region cn-north-1 with FIPS disabled and DualStack disabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin.cn-north-1.amazonaws.com.cn', ], ], 'params' => [ 'Region' => 'cn-north-1', 'UseDualStack' => false, 'UseFIPS' => false, ], ], [ 'documentation' => 'For region us-gov-west-1 with FIPS enabled and DualStack enabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin-fips.us-gov-west-1.api.aws', ], ], 'params' => [ 'Region' => 'us-gov-west-1', 'UseDualStack' => true, 'UseFIPS' => true, ], ], [ 'documentation' => 'For region us-gov-west-1 with FIPS enabled and DualStack disabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin-fips.us-gov-west-1.amazonaws.com', ], ], 'params' => [ 'Region' => 'us-gov-west-1', 'UseDualStack' => false, 'UseFIPS' => true, ], ], [ 'documentation' => 'For region us-gov-west-1 with FIPS disabled and DualStack enabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin.us-gov-west-1.api.aws', ], ], 'params' => [ 'Region' => 'us-gov-west-1', 'UseDualStack' => true, 'UseFIPS' => false, ], ], [ 'documentation' => 'For region us-gov-west-1 with FIPS disabled and DualStack disabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin.us-gov-west-1.amazonaws.com', ], ], 'params' => [ 'Region' => 'us-gov-west-1', 'UseDualStack' => false, 'UseFIPS' => false, ], ], [ 'documentation' => 'For region ap-southeast-1 with FIPS enabled and DualStack enabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin-fips.ap-southeast-1.api.aws', ], ], 'params' => [ 'Region' => 'ap-southeast-1', 'UseDualStack' => true, 'UseFIPS' => true, ], ], [ 'documentation' => 'For region ap-southeast-1 with FIPS enabled and DualStack disabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin-fips.ap-southeast-1.amazonaws.com', ], ], 'params' => [ 'Region' => 'ap-southeast-1', 'UseDualStack' => false, 'UseFIPS' => true, ], ], [ 'documentation' => 'For region ap-southeast-1 with FIPS disabled and DualStack enabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin.ap-southeast-1.api.aws', ], ], 'params' => [ 'Region' => 'ap-southeast-1', 'UseDualStack' => true, 'UseFIPS' => false, ], ], [ 'documentation' => 'For region ap-southeast-1 with FIPS disabled and DualStack disabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin.ap-southeast-1.amazonaws.com', ], ], 'params' => [ 'Region' => 'ap-southeast-1', 'UseDualStack' => false, 'UseFIPS' => false, ], ], [ 'documentation' => 'For region ap-southeast-2 with FIPS enabled and DualStack enabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin-fips.ap-southeast-2.api.aws', ], ], 'params' => [ 'Region' => 'ap-southeast-2', 'UseDualStack' => true, 'UseFIPS' => true, ], ], [ 'documentation' => 'For region ap-southeast-2 with FIPS enabled and DualStack disabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin-fips.ap-southeast-2.amazonaws.com', ], ], 'params' => [ 'Region' => 'ap-southeast-2', 'UseDualStack' => false, 'UseFIPS' => true, ], ], [ 'documentation' => 'For region ap-southeast-2 with FIPS disabled and DualStack enabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin.ap-southeast-2.api.aws', ], ], 'params' => [ 'Region' => 'ap-southeast-2', 'UseDualStack' => true, 'UseFIPS' => false, ], ], [ 'documentation' => 'For region ap-southeast-2 with FIPS disabled and DualStack disabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin.ap-southeast-2.amazonaws.com', ], ], 'params' => [ 'Region' => 'ap-southeast-2', 'UseDualStack' => false, 'UseFIPS' => false, ], ], [ 'documentation' => 'For region ap-southeast-3 with FIPS enabled and DualStack enabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin-fips.ap-southeast-3.api.aws', ], ], 'params' => [ 'Region' => 'ap-southeast-3', 'UseDualStack' => true, 'UseFIPS' => true, ], ], [ 'documentation' => 'For region ap-southeast-3 with FIPS enabled and DualStack disabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin-fips.ap-southeast-3.amazonaws.com', ], ], 'params' => [ 'Region' => 'ap-southeast-3', 'UseDualStack' => false, 'UseFIPS' => true, ], ], [ 'documentation' => 'For region ap-southeast-3 with FIPS disabled and DualStack enabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin.ap-southeast-3.api.aws', ], ], 'params' => [ 'Region' => 'ap-southeast-3', 'UseDualStack' => true, 'UseFIPS' => false, ], ], [ 'documentation' => 'For region ap-southeast-3 with FIPS disabled and DualStack disabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin.ap-southeast-3.amazonaws.com', ], ], 'params' => [ 'Region' => 'ap-southeast-3', 'UseDualStack' => false, 'UseFIPS' => false, ], ], [ 'documentation' => 'For region us-east-1 with FIPS enabled and DualStack enabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin-fips.us-east-1.api.aws', ], ], 'params' => [ 'Region' => 'us-east-1', 'UseDualStack' => true, 'UseFIPS' => true, ], ], [ 'documentation' => 'For region us-east-1 with FIPS enabled and DualStack disabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin-fips.us-east-1.amazonaws.com', ], ], 'params' => [ 'Region' => 'us-east-1', 'UseDualStack' => false, 'UseFIPS' => true, ], ], [ 'documentation' => 'For region us-east-1 with FIPS disabled and DualStack enabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin.us-east-1.api.aws', ], ], 'params' => [ 'Region' => 'us-east-1', 'UseDualStack' => true, 'UseFIPS' => false, ], ], [ 'documentation' => 'For region us-east-1 with FIPS disabled and DualStack disabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin.us-east-1.amazonaws.com', ], ], 'params' => [ 'Region' => 'us-east-1', 'UseDualStack' => false, 'UseFIPS' => false, ], ], [ 'documentation' => 'For region us-east-2 with FIPS enabled and DualStack enabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin-fips.us-east-2.api.aws', ], ], 'params' => [ 'Region' => 'us-east-2', 'UseDualStack' => true, 'UseFIPS' => true, ], ], [ 'documentation' => 'For region us-east-2 with FIPS enabled and DualStack disabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin-fips.us-east-2.amazonaws.com', ], ], 'params' => [ 'Region' => 'us-east-2', 'UseDualStack' => false, 'UseFIPS' => true, ], ], [ 'documentation' => 'For region us-east-2 with FIPS disabled and DualStack enabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin.us-east-2.api.aws', ], ], 'params' => [ 'Region' => 'us-east-2', 'UseDualStack' => true, 'UseFIPS' => false, ], ], [ 'documentation' => 'For region us-east-2 with FIPS disabled and DualStack disabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin.us-east-2.amazonaws.com', ], ], 'params' => [ 'Region' => 'us-east-2', 'UseDualStack' => false, 'UseFIPS' => false, ], ], [ 'documentation' => 'For region cn-northwest-1 with FIPS enabled and DualStack enabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin-fips.cn-northwest-1.api.amazonwebservices.com.cn', ], ], 'params' => [ 'Region' => 'cn-northwest-1', 'UseDualStack' => true, 'UseFIPS' => true, ], ], [ 'documentation' => 'For region cn-northwest-1 with FIPS enabled and DualStack disabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin-fips.cn-northwest-1.amazonaws.com.cn', ], ], 'params' => [ 'Region' => 'cn-northwest-1', 'UseDualStack' => false, 'UseFIPS' => true, ], ], [ 'documentation' => 'For region cn-northwest-1 with FIPS disabled and DualStack enabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin.cn-northwest-1.api.amazonwebservices.com.cn', ], ], 'params' => [ 'Region' => 'cn-northwest-1', 'UseDualStack' => true, 'UseFIPS' => false, ], ], [ 'documentation' => 'For region cn-northwest-1 with FIPS disabled and DualStack disabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://rbin.cn-northwest-1.amazonaws.com.cn', ], ], 'params' => [ 'Region' => 'cn-northwest-1', 'UseDualStack' => false, 'UseFIPS' => false, ], ], [ 'documentation' => 'For custom endpoint with fips disabled and dualstack disabled', 'expect' => [ 'endpoint' => [ 'url' => 'https://example.com', ], ], 'params' => [ 'Region' => 'us-east-1', 'UseDualStack' => false, 'UseFIPS' => false, 'Endpoint' => 'https://example.com', ], ], [ 'documentation' => 'For custom endpoint with fips enabled and dualstack disabled', 'expect' => [ 'error' => 'Invalid Configuration: FIPS and custom endpoint are not supported', ], 'params' => [ 'Region' => 'us-east-1', 'UseDualStack' => false, 'UseFIPS' => true, 'Endpoint' => 'https://example.com', ], ], [ 'documentation' => 'For custom endpoint with fips disabled and dualstack enabled', 'expect' => [ 'error' => 'Invalid Configuration: Dualstack and custom endpoint are not supported', ], 'params' => [ 'Region' => 'us-east-1', 'UseDualStack' => true, 'UseFIPS' => false, 'Endpoint' => 'https://example.com', ], ], ], 'version' => '1.0',];
