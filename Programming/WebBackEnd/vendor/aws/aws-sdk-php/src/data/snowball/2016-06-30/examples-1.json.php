<?php
// This file was auto-generated from sdk-root/src/data/snowball/2016-06-30/examples-1.json
return [ 'version' => '1.0', 'examples' => [ 'CancelCluster' => [ [ 'input' => [ 'ClusterId' => 'CID123e4567-e89b-12d3-a456-426655440000', ], 'comments' => [], 'description' => 'This operation cancels a cluster job. You can only cancel a cluster job while it\'s in the AwaitingQuorum status.', 'id' => 'to-cancel-a-cluster-job-1482533760554', 'title' => 'To cancel a cluster job', ], ], 'CancelJob' => [ [ 'input' => [ 'JobId' => 'JID123e4567-e89b-12d3-a456-426655440000', ], 'comments' => [], 'description' => 'This operation cancels a job. You can only cancel a job before its JobState value changes to PreparingAppliance.', 'id' => 'to-cancel-a-job-for-a-snowball-device-1482534699477', 'title' => 'To cancel a job for a Snowball device', ], ], 'CreateAddress' => [ [ 'input' => [ 'Address' => [ 'City' => 'Seattle', 'Company' => 'My Company\'s Name', 'Country' => 'USA', 'Name' => 'My Name', 'PhoneNumber' => '425-555-5555', 'PostalCode' => '98101', 'StateOrProvince' => 'WA', 'Street1' => '123 Main Street', ], ], 'output' => [ 'AddressId' => 'ADID1234ab12-3eec-4eb3-9be6-9374c10eb51b', ], 'comments' => [], 'description' => 'This operation creates an address for a job. Addresses are validated at the time of creation. The address you provide must be located within the serviceable area of your region. If the address is invalid or unsupported, then an exception is thrown.', 'id' => 'to-create-an-address-for-a-job-1482535416294', 'title' => 'To create an address for a job', ], ], 'CreateCluster' => [ [ 'input' => [ 'AddressId' => 'ADID1234ab12-3eec-4eb3-9be6-9374c10eb51b', 'Description' => 'MyCluster', 'JobType' => 'LOCAL_USE', 'KmsKeyARN' => 'arn:aws:kms:us-east-1:123456789012:key/abcd1234-12ab-34cd-56ef-123456123456', 'Notification' => [ 'JobStatesToNotify' => [], 'NotifyAll' => false, ], 'Resources' => [ 'S3Resources' => [ [ 'BucketArn' => 'arn:aws:s3:::MyBucket', 'KeyRange' => [], ], ], ], 'RoleARN' => 'arn:aws:iam::123456789012:role/snowball-import-S3-role', 'ShippingOption' => 'SECOND_DAY', 'SnowballType' => 'EDGE', ], 'output' => [ 'ClusterId' => 'CID123e4567-e89b-12d3-a456-426655440000', ], 'comments' => [], 'description' => 'Creates an empty cluster. Each cluster supports five nodes. You use the CreateJob action separately to create the jobs for each of these nodes. The cluster does not ship until these five node jobs have been created.', 'id' => 'to-create-a-cluster-1482864724077', 'title' => 'To create a cluster', ], ], 'CreateJob' => [ [ 'input' => [ 'AddressId' => 'ADID1234ab12-3eec-4eb3-9be6-9374c10eb51b', 'Description' => 'My Job', 'JobType' => 'IMPORT', 'KmsKeyARN' => 'arn:aws:kms:us-east-1:123456789012:key/abcd1234-12ab-34cd-56ef-123456123456', 'Notification' => [ 'JobStatesToNotify' => [], 'NotifyAll' => false, ], 'Resources' => [ 'S3Resources' => [ [ 'BucketArn' => 'arn:aws:s3:::MyBucket', 'KeyRange' => [], ], ], ], 'RoleARN' => 'arn:aws:iam::123456789012:role/snowball-import-S3-role', 'ShippingOption' => 'SECOND_DAY', 'SnowballCapacityPreference' => 'T80', 'SnowballType' => 'STANDARD', ], 'output' => [ 'JobId' => 'JID123e4567-e89b-12d3-a456-426655440000', ], 'comments' => [], 'description' => 'Creates a job to import or export data between Amazon S3 and your on-premises data center. Your AWS account must have the right trust policies and permissions in place to create a job for Snowball. If you\'re creating a job for a node in a cluster, you only need to provide the clusterId value; the other job attributes are inherited from the cluster.', 'id' => 'to-create-a-job-1482864834886', 'title' => 'To create a job', ], ], 'DescribeAddress' => [ [ 'input' => [ 'AddressId' => 'ADID1234ab12-3eec-4eb3-9be6-9374c10eb51b', ], 'output' => [ 'Address' => [ 'AddressId' => 'ADID5643ec50-3eec-4eb3-9be6-9374c10eb51b', 'City' => 'Seattle', 'Company' => 'My Company', 'Country' => 'US', 'Name' => 'My Name', 'PhoneNumber' => '425-555-5555', 'PostalCode' => '98101', 'StateOrProvince' => 'WA', 'Street1' => '123 Main Street', ], ], 'comments' => [], 'description' => 'This operation describes an address for a job.', 'id' => 'to-describe-an-address-for-a-job-1482538608745', 'title' => 'To describe an address for a job', ], ], 'DescribeAddresses' => [ [ 'input' => [], 'output' => [ 'Addresses' => [ [ 'AddressId' => 'ADID1234ab12-3eec-4eb3-9be6-9374c10eb51b', 'City' => 'Seattle', 'Company' => 'My Company', 'Country' => 'US', 'Name' => 'My Name', 'PhoneNumber' => '425-555-5555', 'PostalCode' => '98101', 'StateOrProvince' => 'WA', 'Street1' => '123 Main Street', ], ], ], 'comments' => [], 'description' => 'This operation describes all the addresses that you\'ve created for AWS Snowball. Calling this API in one of the US regions will return addresses from the list of all addresses associated with this account in all US regions.', 'id' => 'to-describe-all-the-addresses-youve-created-for-aws-snowball-1482538936603', 'title' => 'To describe all the addresses you\'ve created for AWS Snowball', ], ], 'DescribeCluster' => [ [ 'input' => [ 'ClusterId' => 'CID123e4567-e89b-12d3-a456-426655440000', ], 'output' => [ 'ClusterMetadata' => [ 'AddressId' => 'ADID1234ab12-3eec-4eb3-9be6-9374c10eb51b', 'ClusterId' => 'CID123e4567-e89b-12d3-a456-426655440000', 'ClusterState' => 'Pending', 'CreationDate' => '1480475517.0', 'Description' => 'MyCluster', 'JobType' => 'LOCAL_USE', 'KmsKeyARN' => 'arn:aws:kms:us-east-1:123456789012:key/abcd1234-12ab-34cd-56ef-123456123456', 'Notification' => [ 'JobStatesToNotify' => [], 'NotifyAll' => false, ], 'Resources' => [ 'S3Resources' => [ [ 'BucketArn' => 'arn:aws:s3:::MyBucket', 'KeyRange' => [], ], ], ], 'RoleARN' => 'arn:aws:iam::123456789012:role/snowball-import-S3-role', 'ShippingOption' => 'SECOND_DAY', ], ], 'comments' => [], 'description' => 'Returns information about a specific cluster including shipping information, cluster status, and other important metadata.', 'id' => 'to-describe-a-cluster-1482864218396', 'title' => 'To describe a cluster', ], ], 'DescribeJob' => [ [ 'input' => [ 'JobId' => 'JID123e4567-e89b-12d3-a456-426655440000', ], 'output' => [ 'JobMetadata' => [ 'AddressId' => 'ADID1234ab12-3eec-4eb3-9be6-9374c10eb51b', 'CreationDate' => '1475626164', 'Description' => 'My Job', 'JobId' => 'JID123e4567-e89b-12d3-a456-426655440000', 'JobState' => 'New', 'JobType' => 'IMPORT', 'KmsKeyARN' => 'arn:aws:kms:us-east-1:123456789012:key/abcd1234-12ab-34cd-56ef-123456123456', 'Notification' => [ 'JobStatesToNotify' => [], 'NotifyAll' => false, ], 'Resources' => [ 'S3Resources' => [ [ 'BucketArn' => 'arn:aws:s3:::MyBucket', 'KeyRange' => [], ], ], ], 'RoleARN' => 'arn:aws:iam::123456789012:role/snowball-import-S3-role', 'ShippingDetails' => [ 'ShippingOption' => 'SECOND_DAY', ], 'SnowballCapacityPreference' => 'T80', 'SnowballType' => 'STANDARD', ], ], 'comments' => [], 'description' => 'This operation describes a job you\'ve created for AWS Snowball.', 'id' => 'to-describe-a-job-youve-created-for-aws-snowball-1482539500180', 'title' => 'To describe a job you\'ve created for AWS Snowball', ], ], 'GetJobManifest' => [ [ 'input' => [ 'JobId' => 'JID123e4567-e89b-12d3-a456-426655440000', ], 'output' => [ 'ManifestURI' => 'https://awsie-frosty-manifests-prod.s3.amazonaws.com/JID123e4567-e89b-12d3-a456-426655440000_manifest.bin?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20161224T005115Z&X-Amz-SignedHeaders=...', ], 'comments' => [], 'description' => 'Returns a link to an Amazon S3 presigned URL for the manifest file associated with the specified JobId value. You can access the manifest file for up to 60 minutes after this request has been made. To access the manifest file after 60 minutes have passed, you\'ll have to make another call to the GetJobManifest action.The manifest is an encrypted file that you can download after your job enters the WithCustomer status. The manifest is decrypted by using the UnlockCode code value, when you pass both values to the Snowball through the Snowball client when the client is started for the first time.As a best practice, we recommend that you don\'t save a copy of an UnlockCode value in the same location as the manifest file for that job. Saving these separately helps prevent unauthorized parties from gaining access to the Snowball associated with that job.The credentials of a given job, including its manifest file and unlock code, expire 90 days after the job is created.', 'id' => 'to-get-the-manifest-for-a-job-youve-created-for-aws-snowball-1482540389246', 'title' => 'To get the manifest for a job you\'ve created for AWS Snowball', ], ], 'GetJobUnlockCode' => [ [ 'input' => [ 'JobId' => 'JID123e4567-e89b-12d3-a456-426655440000', ], 'output' => [ 'UnlockCode' => '12345-abcde-56789-fghij-01234', ], 'comments' => [], 'description' => 'Returns the UnlockCode code value for the specified job. A particular UnlockCode value can be accessed for up to 90 days after the associated job has been created.The UnlockCode value is a 29-character code with 25 alphanumeric characters and 4 hyphens. This code is used to decrypt the manifest file when it is passed along with the manifest to the Snowball through the Snowball client when the client is started for the first time.As a best practice, we recommend that you don\'t save a copy of the UnlockCode in the same location as the manifest file for that job. Saving these separately helps prevent unauthorized parties from gaining access to the Snowball associated with that job.', 'id' => 'to-get-the-unlock-code-for-a-job-youve-created-for-aws-snowball-1482541987286', 'title' => 'To get the unlock code for a job you\'ve created for AWS Snowball', ], ], 'GetSnowballUsage' => [ [ 'input' => [], 'output' => [ 'SnowballLimit' => 1, 'SnowballsInUse' => 0, ], 'comments' => [], 'description' => 'Returns information about the Snowball service limit for your account, and also the number of Snowballs your account has in use.The default service limit for the number of Snowballs that you can have at one time is 1. If you want to increase your service limit, contact AWS Support.', 'id' => 'to-see-your-snowball-service-limit-and-the-number-of-snowballs-you-have-in-use-1482863394588', 'title' => 'To see your Snowball service limit and the number of Snowballs you have in use', ], ], 'ListClusterJobs' => [ [ 'input' => [ 'ClusterId' => 'CID123e4567-e89b-12d3-a456-426655440000', ], 'output' => [ 'JobListEntries' => [ [ 'CreationDate' => '1480475524.0', 'Description' => 'MyClustrer-node-001', 'IsMaster' => false, 'JobId' => 'JID123e4567-e89b-12d3-a456-426655440000', 'JobState' => 'New', 'JobType' => 'LOCAL_USE', 'SnowballType' => 'EDGE', ], [ 'CreationDate' => '1480475525.0', 'Description' => 'MyClustrer-node-002', 'IsMaster' => false, 'JobId' => 'JID123e4567-e89b-12d3-a456-426655440001', 'JobState' => 'New', 'JobType' => 'LOCAL_USE', 'SnowballType' => 'EDGE', ], [ 'CreationDate' => '1480475525.0', 'Description' => 'MyClustrer-node-003', 'IsMaster' => false, 'JobId' => 'JID123e4567-e89b-12d3-a456-426655440002', 'JobState' => 'New', 'JobType' => 'LOCAL_USE', 'SnowballType' => 'EDGE', ], [ 'CreationDate' => '1480475525.0', 'Description' => 'MyClustrer-node-004', 'IsMaster' => false, 'JobId' => 'JID123e4567-e89b-12d3-a456-426655440003', 'JobState' => 'New', 'JobType' => 'LOCAL_USE', 'SnowballType' => 'EDGE', ], [ 'CreationDate' => '1480475525.0', 'Description' => 'MyClustrer-node-005', 'IsMaster' => false, 'JobId' => 'JID123e4567-e89b-12d3-a456-426655440004', 'JobState' => 'New', 'JobType' => 'LOCAL_USE', 'SnowballType' => 'EDGE', ], ], ], 'comments' => [], 'description' => 'Returns an array of JobListEntry objects of the specified length. Each JobListEntry object is for a job in the specified cluster and contains a job\'s state, a job\'s ID, and other information.', 'id' => 'to-get-a-list-of-jobs-in-a-cluster-that-youve-created-for-aws-snowball-1482863105773', 'title' => 'To get a list of jobs in a cluster that you\'ve created for AWS Snowball', ], ], 'ListClusters' => [ [ 'input' => [], 'output' => [ 'ClusterListEntries' => [ [ 'ClusterId' => 'CID123e4567-e89b-12d3-a456-426655440000', 'ClusterState' => 'Pending', 'CreationDate' => '1480475517.0', 'Description' => 'MyCluster', ], ], ], 'comments' => [], 'description' => 'Returns an array of ClusterListEntry objects of the specified length. Each ClusterListEntry object contains a cluster\'s state, a cluster\'s ID, and other important status information.', 'id' => 'to-get-a-list-of-clusters-that-youve-created-for-aws-snowball-1482862223003', 'title' => 'To get a list of clusters that you\'ve created for AWS Snowball', ], ], 'ListJobs' => [ [ 'input' => [], 'output' => [ 'JobListEntries' => [ [ 'CreationDate' => '1460678186.0', 'Description' => 'MyJob', 'IsMaster' => false, 'JobId' => 'JID123e4567-e89b-12d3-a456-426655440000', 'JobState' => 'New', 'JobType' => 'IMPORT', 'SnowballType' => 'STANDARD', ], ], ], 'comments' => [], 'description' => 'Returns an array of JobListEntry objects of the specified length. Each JobListEntry object contains a job\'s state, a job\'s ID, and a value that indicates whether the job is a job part, in the case of export jobs. Calling this API action in one of the US regions will return jobs from the list of all jobs associated with this account in all US regions.', 'id' => 'to-get-a-list-of-jobs-that-youve-created-for-aws-snowball-1482542167627', 'title' => 'To get a list of jobs that you\'ve created for AWS Snowball', ], ], 'UpdateCluster' => [ [ 'input' => [ 'AddressId' => 'ADID1234ab12-3eec-4eb3-9be6-9374c10eb51b', 'ClusterId' => 'CID123e4567-e89b-12d3-a456-426655440000', 'Description' => 'updated-cluster-name', ], 'comments' => [], 'description' => 'This action allows you to update certain parameters for a cluster. Once the cluster changes to a different state, usually within 60 minutes of it being created, this action is no longer available.', 'id' => 'to-update-a-cluster-1482863900595', 'title' => 'To update a cluster', ], ], 'UpdateJob' => [ [ 'input' => [ 'AddressId' => 'ADID1234ab12-3eec-4eb3-9be6-9374c10eb51b', 'Description' => 'updated-job-name', 'JobId' => 'JID123e4567-e89b-12d3-a456-426655440000', 'ShippingOption' => 'NEXT_DAY', 'SnowballCapacityPreference' => 'T100', ], 'comments' => [], 'description' => 'This action allows you to update certain parameters for a job. Once the job changes to a different job state, usually within 60 minutes of the job being created, this action is no longer available.', 'id' => 'to-update-a-job-1482863556886', 'title' => 'To update a job', ], ], ],];
