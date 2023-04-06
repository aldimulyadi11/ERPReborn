<?php
// This file was auto-generated from sdk-root/src/data/internetmonitor/2021-06-03/docs-2.json
return [ 'version' => '2.0', 'service' => '<p>Amazon CloudWatch Internet Monitor provides visibility into how internet issues impact the performance and availability between your applications hosted on Amazon Web Services and your end users. It reduces the time it takes for you to diagnose internet issues from days to minutes. Internet Monitor uses the connectivity data that Amazon Web Services captures from its global networking footprint to calculate a baseline of performance and availability for internet traffic. This is the same data that Amazon Web Services uses to monitor internet uptime and availability. With those measurements as a baseline, Internet Monitor raises awareness for you when there are significant problems for your end users in the different geographic locations where your application runs.</p> <p>Internet Monitor publishes internet measurements to CloudWatch Logs and CloudWatch Metrics, to easily support using CloudWatch tools with health information for geographies and networks specific to your application. Internet Monitor sends health events to Amazon EventBridge so that you can set up notifications. If an issue is caused by the Amazon Web Services network, you also automatically receive an Amazon Web Services Health Dashboard notification with the steps that Amazon Web Services is taking to mitigate the problem.</p> <p>To use Internet Monitor, you create a <i>monitor</i> and associate your application\'s resources with it, VPCs, CloudFront distributions, or WorkSpaces directories, to enable Internet Monitor to know where your application\'s internet traffic is. Internet Monitor then provides internet measurements from Amazon Web Services that are specific to the locations and networks that communicate with your application.</p> <p>For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-InternetMonitor.html">Using Amazon CloudWatch Internet Monitor</a> in the <i>Amazon CloudWatch User Guide</i>.</p>', 'operations' => [ 'CreateMonitor' => '<p>Creates a monitor in Amazon CloudWatch Internet Monitor. A monitor is built based on information from the application resources that you add: Amazon Virtual Private Clouds (VPCs), Amazon CloudFront distributions, and WorkSpaces directories. Internet Monitor then publishes internet measurements from Amazon Web Services that are specific to the <i>city-networks</i>, that is, the locations and ASNs (typically internet service providers or ISPs), where clients access your application. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-InternetMonitor.html">Using Amazon CloudWatch Internet Monitor</a> in the <i>Amazon CloudWatch User Guide</i>.</p> <p>When you create a monitor, you set a maximum limit for the number of city-networks where client traffic is monitored. The city-network maximum that you choose is the limit, but you only pay for the number of city-networks that are actually monitored. You can change the maximum at any time by updating your monitor. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/IMCityNetworksMaximum.html">Choosing a city-network maximum value</a> in the <i>Amazon CloudWatch User Guide</i>.</p>', 'DeleteMonitor' => '<p>Deletes a monitor in Amazon CloudWatch Internet Monitor. </p>', 'GetHealthEvent' => '<p>Gets information the Amazon CloudWatch Internet Monitor has created and stored about a health event for a specified monitor. This information includes the impacted locations, and all of the information related to the event by location.</p> <p>The information returned includes the performance, availability, and round-trip time impact, information about the network providers, the event type, and so on.</p> <p>Information rolled up at the global traffic level is also returned, including the impact type and total traffic impact.</p>', 'GetMonitor' => '<p>Gets information about a monitor in Amazon CloudWatch Internet Monitor based on a monitor name. The information returned includes the Amazon Resource Name (ARN), create time, modified time, resources included in the monitor, and status information.</p>', 'ListHealthEvents' => '<p>Lists all health events for a monitor in Amazon CloudWatch Internet Monitor. Returns all information for health events including the client location information the network cause and status, event start and end time, percentage of total traffic impacted, and status.</p> <note> <p>Health events that have start times during the time frame that is requested are not included in the list of health events.</p> </note>', 'ListMonitors' => '<p>Lists all of your monitors for Amazon CloudWatch Internet Monitor and their statuses, along with the Amazon Resource Name (ARN) and name of each monitor.</p>', 'ListTagsForResource' => '<p>Lists the tags for a resource. Tags are supported only for monitors in Amazon CloudWatch Internet Monitor.</p>', 'TagResource' => '<p>Adds a tag to a resource. Tags are supported only for monitors in Amazon CloudWatch Internet Monitor. You can add a maximum of 50 tags in Internet Monitor.</p> <p>A minimum of one tag is required for this call. It returns an error if you use the <code>TagResource</code> request with 0 tags.</p>', 'UntagResource' => '<p>Removes a tag from a resource.</p>', 'UpdateMonitor' => '<p>Updates a monitor. You can update a monitor to change the maximum number of city-networks (locations and ASNs or internet service providers), to add or remove resources, or to change the status of the monitor. Note that you can\'t change the name of a monitor.</p> <p>The city-network maximum that you choose is the limit, but you only pay for the number of city-networks that are actually monitored. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/IMCityNetworksMaximum.html">Choosing a city-network maximum value</a> in the <i>Amazon CloudWatch User Guide</i>.</p>', ], 'shapes' => [ 'AccessDeniedException' => [ 'base' => '<p>You don\'t have sufficient permission to perform this action.</p>', 'refs' => [], ], 'Arn' => [ 'base' => NULL, 'refs' => [ 'GetHealthEventOutput$EventArn' => '<p>The Amazon Resource Name (ARN) of the event.</p>', 'HealthEvent$EventArn' => '<p>The Amazon Resource Name (ARN) of the event.</p>', 'SetOfARNs$member' => NULL, ], ], 'AvailabilityMeasurement' => [ 'base' => '<p>Measurements about the availability for your application on the internet, calculated by Amazon CloudWatch Internet Monitor. Amazon Web Services has substantial historical data about internet performance and availability between Amazon Web Services services and different network providers and geographies. By applying statistical analysis to the data, Internet Monitor can detect when the performance and availability for your application has dropped, compared to an estimated baseline that\'s already calculated. To make it easier to see those drops, we report that information to you in the form of health scores: a performance score and an availability score.</p> <p>Availability in Internet Monitor represents the estimated percentage of traffic that is not seeing an availability drop. For example, an availability score of 99% for an end user and service location pair is equivalent to 1% of the traffic experiencing an availability drop for that pair.</p> <p>For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-IM-inside-internet-monitor.html#IMExperienceScores">How Internet Monitor calculates performance and availability scores</a> in the Amazon CloudWatch Internet Monitor section of the <i>Amazon CloudWatch User Guide</i>.</p>', 'refs' => [ 'InternetHealth$Availability' => '<p>Availability in Internet Monitor represents the estimated percentage of traffic that is not seeing an availability drop. For example, an availability score of 99% for an end user and service location pair is equivalent to 1% of the traffic experiencing an availability drop for that pair.</p> <p>For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-IM-inside-internet-monitor.html#IMExperienceScores">How Internet Monitor calculates performance and availability scores</a> in the Amazon CloudWatch Internet Monitor section of the <i>CloudWatch User Guide</i>.</p>', ], ], 'BadRequestException' => [ 'base' => '<p>A bad request was received.</p>', 'refs' => [], ], 'ConflictException' => [ 'base' => '<p>The requested resource is in use.</p>', 'refs' => [], ], 'CreateMonitorInput' => [ 'base' => NULL, 'refs' => [], ], 'CreateMonitorOutput' => [ 'base' => NULL, 'refs' => [], ], 'DeleteMonitorInput' => [ 'base' => NULL, 'refs' => [], ], 'DeleteMonitorOutput' => [ 'base' => NULL, 'refs' => [], ], 'Double' => [ 'base' => NULL, 'refs' => [ 'AvailabilityMeasurement$ExperienceScore' => '<p>Experience scores, or health scores are calculated for different geographic and network provider combinations (that is, different granularities) and also summed into global scores. If you view performance or availability scores without filtering for any specific geography or service provider, Amazon CloudWatch Internet Monitor provides global health scores.</p> <p>The Amazon CloudWatch Internet Monitor chapter in the <i>CloudWatch User Guide</i> includes detailed information about how Internet Monitor calculates health scores, including performance and availability scores, and when it creates and resolves health events. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-IM-inside-internet-monitor.html#IMExperienceScores">How Amazon Web Services calculates performance and availability scores</a> in the Amazon CloudWatch Internet Monitor section of the <i>CloudWatch User Guide</i>.</p>', 'AvailabilityMeasurement$PercentOfTotalTrafficImpacted' => '<p>The percentage of impact caused by a health event for total traffic globally.</p> <p>For information about how Internet Monitor calculates impact, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-IM-inside-internet-monitor.html">Inside Internet Monitor</a> in the Amazon CloudWatch Internet Monitor section of the Amazon CloudWatch User Guide.</p>', 'AvailabilityMeasurement$PercentOfClientLocationImpacted' => '<p>The percentage of impact caused by a health event for client location traffic globally.</p> <p>For information about how Internet Monitor calculates impact, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-IM-inside-internet-monitor.html">Inside Internet Monitor</a> in the Amazon CloudWatch Internet Monitor section of the Amazon CloudWatch User Guide.</p>', 'GetHealthEventOutput$PercentOfTotalTrafficImpacted' => '<p>The impact on total traffic that a health event has.</p>', 'HealthEvent$PercentOfTotalTrafficImpacted' => '<p>The impact on global traffic monitored by this monitor for this health event.</p>', 'ImpactedLocation$Latitude' => '<p>The latitude where the health event is located.</p>', 'ImpactedLocation$Longitude' => '<p>The longitude where the health event is located.</p>', 'PerformanceMeasurement$ExperienceScore' => '<p>Experience scores, or health scores, are calculated for different geographic and network provider combinations (that is, different granularities) and also totaled into global scores. If you view performance or availability scores without filtering for any specific geography or service provider, Amazon CloudWatch Internet Monitor provides global health scores.</p> <p>The Amazon CloudWatch Internet Monitor chapter in the CloudWatch User Guide includes detailed information about how Internet Monitor calculates health scores, including performance and availability scores, and when it creates and resolves health events. For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-IM-inside-internet-monitor.html#IMExperienceScores">How Amazon Web Services calculates performance and availability scores</a> in the Amazon CloudWatch Internet Monitor section of the <i>CloudWatch User Guide</i>.</p>', 'PerformanceMeasurement$PercentOfTotalTrafficImpacted' => '<p>How much performance impact was caused by a health event for total traffic globally. For performance, this is the percentage of how much latency increased during the event compared to typical performance for your application traffic globally. </p> <p>For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-IM-inside-internet-monitor.html#IMHealthEventStartStop">When Amazon Web Services creates and resolves health events</a> in the Amazon CloudWatch Internet Monitor section of the <i>CloudWatch User Guide</i>.</p>', 'PerformanceMeasurement$PercentOfClientLocationImpacted' => '<p>How much performance impact was caused by a health event at a client location. For performance, this is the percentage of how much latency increased during the event compared to typical performance for traffic, from this client location to an Amazon Web Services location, using a specific client network. </p> <p>For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-IM-inside-internet-monitor.html#IMHealthEventStartStop">When Amazon Web Services creates and resolves health events</a> in the Amazon CloudWatch Internet Monitor section of the <i>CloudWatch User Guide</i>.</p>', 'RoundTripTime$P50' => '<p>RTT at the 50th percentile (p50).</p>', 'RoundTripTime$P90' => '<p>RTT at the 90th percentile (p90). </p>', 'RoundTripTime$P95' => '<p>RTT at the 95th percentile (p95). </p>', ], ], 'GetHealthEventInput' => [ 'base' => NULL, 'refs' => [], ], 'GetHealthEventOutput' => [ 'base' => NULL, 'refs' => [], ], 'GetMonitorInput' => [ 'base' => NULL, 'refs' => [], ], 'GetMonitorOutput' => [ 'base' => NULL, 'refs' => [], ], 'HealthEvent' => [ 'base' => '<p>Information about a health event created in a monitor in Amazon CloudWatch Internet Monitor.</p>', 'refs' => [ 'HealthEventList$member' => NULL, ], ], 'HealthEventImpactType' => [ 'base' => NULL, 'refs' => [ 'GetHealthEventOutput$ImpactType' => '<p>The type of impairment of a specific health event.</p>', 'HealthEvent$ImpactType' => '<p>The type of impairment for a health event.</p>', ], ], 'HealthEventList' => [ 'base' => NULL, 'refs' => [ 'ListHealthEventsOutput$HealthEvents' => '<p>A list of health events.</p>', ], ], 'HealthEventName' => [ 'base' => NULL, 'refs' => [ 'GetHealthEventInput$EventId' => '<p>The internally generated identifier of a health event. Because <code>EventID</code> contains the forward slash (“/”) character, you must URL-encode the <code>EventID</code> field in the request URL.</p>', 'GetHealthEventOutput$EventId' => '<p>The internally generated identifier of a health event.</p>', 'HealthEvent$EventId' => '<p>The internally generated identifier of a specific network traffic impairment health event.</p>', ], ], 'HealthEventStatus' => [ 'base' => NULL, 'refs' => [ 'GetHealthEventOutput$Status' => '<p>The status of a health event.</p>', 'HealthEvent$Status' => '<p>Health event list member.</p>', 'ImpactedLocation$Status' => '<p>The status of the health event at an impacted location.</p>', 'ListHealthEventsInput$EventStatus' => '<p>The status of a health event.</p>', ], ], 'ImpactedLocation' => [ 'base' => '<p>Information about a location impacted by a health event in Amazon CloudWatch Internet Monitor.</p> <p>Geographic regions are hierarchically categorized into country, subdivision, metro and city geographic granularities. The geographic region is identified based on the IP address used at the client locations.</p>', 'refs' => [ 'ImpactedLocationsList$member' => NULL, ], ], 'ImpactedLocationsList' => [ 'base' => NULL, 'refs' => [ 'GetHealthEventOutput$ImpactedLocations' => '<p>The locations affected by a health event.</p>', 'HealthEvent$ImpactedLocations' => '<p>The locations impacted by the health event.</p>', ], ], 'InternalServerErrorException' => [ 'base' => '<p>There was an internal server error.</p>', 'refs' => [], ], 'InternalServerException' => [ 'base' => '<p>An internal error occurred.</p>', 'refs' => [], ], 'InternetHealth' => [ 'base' => '<p>Internet health includes measurements calculated by Amazon CloudWatch Internet Monitor about the performance and availability for your application on the internet. Amazon Web Services has substantial historical data about internet performance and availability between Amazon Web Services services and different network providers and geographies. By applying statistical analysis to the data, Internet Monitor can detect when the performance and availability for your application has dropped, compared to an estimated baseline that\'s already calculated. To make it easier to see those drops, we report that information to you in the form of health scores: a performance score and an availability score.</p>', 'refs' => [ 'ImpactedLocation$InternetHealth' => '<p>The calculated health at a specific location.</p>', ], ], 'InternetMeasurementsLogDelivery' => [ 'base' => '<p>Configuration information for other locations that you choose to publish Amazon CloudWatch Internet Monitor internet measurements to, such as Amazon S3. The measurements are also published to Amazon CloudWatch Logs.</p>', 'refs' => [ 'CreateMonitorInput$InternetMeasurementsLogDelivery' => '<p>Publish internet measurements for Internet Monitor to another location, such as an Amazon S3 bucket. The measurements are also published to Amazon CloudWatch Logs.</p>', 'GetMonitorOutput$InternetMeasurementsLogDelivery' => '<p>Publish internet measurements for Internet Monitor to another location, such as an Amazon S3 bucket. The measurements are also published to Amazon CloudWatch Logs.</p>', 'UpdateMonitorInput$InternetMeasurementsLogDelivery' => '<p>Publish internet measurements for Internet Monitor to another location, such as an Amazon S3 bucket. The measurements are also published to Amazon CloudWatch Logs.</p>', ], ], 'LimitExceededException' => [ 'base' => '<p>The request exceeded a service quota.</p>', 'refs' => [], ], 'ListHealthEventsInput' => [ 'base' => NULL, 'refs' => [], ], 'ListHealthEventsOutput' => [ 'base' => NULL, 'refs' => [], ], 'ListMonitorsInput' => [ 'base' => NULL, 'refs' => [], ], 'ListMonitorsOutput' => [ 'base' => NULL, 'refs' => [], ], 'ListTagsForResourceInput' => [ 'base' => NULL, 'refs' => [], ], 'ListTagsForResourceOutput' => [ 'base' => NULL, 'refs' => [], ], 'LogDeliveryStatus' => [ 'base' => NULL, 'refs' => [ 'S3Config$LogDeliveryStatus' => '<p>The status of publishing Internet Monitor internet measurements to an Amazon S3 bucket.</p>', ], ], 'Long' => [ 'base' => NULL, 'refs' => [ 'ImpactedLocation$ASNumber' => '<p>The Autonomous System Number (ASN) of the network at an impacted location.</p>', 'Network$ASNumber' => '<p>The Autonomous System Number (ASN) of the internet provider or network.</p>', ], ], 'MaxCityNetworksToMonitor' => [ 'base' => NULL, 'refs' => [ 'CreateMonitorInput$MaxCityNetworksToMonitor' => '<p>The maximum number of city-networks to monitor for your resources. A city-network is the location (city) where clients access your application resources from and the network or ASN, such as an internet service provider (ISP), that clients access the resources through. This limit helps control billing costs.</p> <p>To learn more, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/IMCityNetworksMaximum.html">Choosing a city-network maximum value </a> in the Amazon CloudWatch Internet Monitor section of the <i>CloudWatch User Guide</i>.</p>', 'GetMonitorOutput$MaxCityNetworksToMonitor' => '<p>The maximum number of city-networks to monitor for your resources. A city-network is the location (city) where clients access your application resources from and the network or ASN, such as an internet service provider (ISP), that clients access the resources through. This limit helps control billing costs.</p> <p>To learn more, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/IMCityNetworksMaximum.html">Choosing a city-network maximum value </a> in the Amazon CloudWatch Internet Monitor section of the <i>CloudWatch User Guide</i>.</p>', 'UpdateMonitorInput$MaxCityNetworksToMonitor' => '<p>The maximum number of city-networks to monitor for your resources. A city-network is the location (city) where clients access your application resources from and the network or ASN, such as an internet service provider, that clients access the resources through.</p>', ], ], 'MaxResults' => [ 'base' => NULL, 'refs' => [ 'ListHealthEventsInput$MaxResults' => '<p>The number of health event objects that you want to return with this call. </p>', 'ListMonitorsInput$MaxResults' => '<p>The number of monitor objects that you want to return with this call.</p>', ], ], 'Monitor' => [ 'base' => '<p>The description of and information about a monitor in Amazon CloudWatch Internet Monitor. </p>', 'refs' => [ 'MonitorList$member' => NULL, ], ], 'MonitorArn' => [ 'base' => NULL, 'refs' => [ 'CreateMonitorOutput$Arn' => '<p>The Amazon Resource Name (ARN) of the monitor.</p>', 'GetMonitorOutput$MonitorArn' => '<p>The Amazon Resource Name (ARN) of the monitor.</p>', 'ListTagsForResourceInput$ResourceArn' => '<p>The Amazon Resource Name (ARN) for a resource.</p>', 'Monitor$MonitorArn' => '<p>The Amazon Resource Name (ARN) of the monitor.</p>', 'TagResourceInput$ResourceArn' => '<p>The Amazon Resource Name (ARN) for a tag that you add to a resource. Tags are supported only for monitors in Amazon CloudWatch Internet Monitor.</p>', 'UntagResourceInput$ResourceArn' => '<p>The Amazon Resource Name (ARN) for a tag you remove a resource from.</p>', 'UpdateMonitorOutput$MonitorArn' => '<p>The Amazon Resource Name (ARN) of the monitor.</p>', ], ], 'MonitorConfigState' => [ 'base' => NULL, 'refs' => [ 'CreateMonitorOutput$Status' => '<p>The status of a monitor.</p>', 'GetMonitorOutput$Status' => '<p>The status of the monitor.</p>', 'Monitor$Status' => '<p>The status of a monitor.</p>', 'UpdateMonitorInput$Status' => '<p>The status for a monitor. The accepted values for <code>Status</code> with the <code>UpdateMonitor</code> API call are the following: <code>ACTIVE</code> and <code>INACTIVE</code>. The following values are <i>not</i> accepted: <code>PENDING</code>, and <code>ERROR</code>.</p>', 'UpdateMonitorOutput$Status' => '<p>The status of a monitor.</p>', ], ], 'MonitorList' => [ 'base' => NULL, 'refs' => [ 'ListMonitorsOutput$Monitors' => '<p>A list of monitors.</p>', ], ], 'MonitorProcessingStatusCode' => [ 'base' => NULL, 'refs' => [ 'GetMonitorOutput$ProcessingStatus' => '<p>The health of the data processing for the monitor.</p>', 'Monitor$ProcessingStatus' => '<p>The health of data processing for the monitor.</p>', ], ], 'Network' => [ 'base' => '<p>An internet service provider (ISP) or network in Amazon CloudWatch Internet Monitor.</p>', 'refs' => [ 'NetworkList$member' => NULL, ], ], 'NetworkImpairment' => [ 'base' => '<p>Information about the network impairment for a specific network measured by Amazon CloudWatch Internet Monitor.</p>', 'refs' => [ 'ImpactedLocation$CausedBy' => '<p>The cause of the impairment. There are two types of network impairments: Amazon Web Services network issues or internet issues. Internet issues are typically a problem with a network provider, like an internet service provider (ISP).</p>', ], ], 'NetworkList' => [ 'base' => NULL, 'refs' => [ 'NetworkImpairment$Networks' => '<p>The networks that could be impacted by a network impairment event.</p>', 'NetworkImpairment$AsPath' => '<p>The combination of the Autonomous System Number (ASN) of the network and the name of the network.</p>', ], ], 'NotFoundException' => [ 'base' => '<p>The request specifies something that doesn\'t exist.</p>', 'refs' => [], ], 'PerformanceMeasurement' => [ 'base' => '<p>Measurements about the performance for your application on the internet calculated by Amazon CloudWatch Internet Monitor. Amazon Web Services has substantial historical data about internet performance and availability between Amazon Web Services services and different network providers and geographies. By applying statistical analysis to the data, Internet Monitor can detect when the performance and availability for your application has dropped, compared to an estimated baseline that\'s already calculated. To make it easier to see those drops, we report that information to you in the form of health scores: a performance score and an availability score.</p> <p>Performance in Internet Monitor represents the estimated percentage of traffic that is not seeing a performance drop. For example, a performance score of 99% for an end user and service location pair is equivalent to 1% of the traffic experiencing a performance drop for that pair.</p> <p>For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-IM-inside-internet-monitor.html#IMExperienceScores">How Internet Monitor calculates performance and availability scores</a> in the Amazon CloudWatch Internet Monitor section of the <i>CloudWatch User Guide</i>.</p>', 'refs' => [ 'InternetHealth$Performance' => '<p>Performance in Internet Monitor represents the estimated percentage of traffic that is not seeing a performance drop. For example, a performance score of 99% for an end user and service location pair is equivalent to 1% of the traffic experiencing a performance drop for that pair.</p> <p>For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-IM-inside-internet-monitor.html#IMExperienceScores">How Internet Monitor calculates performance and availability scores</a> in the Amazon CloudWatch Internet Monitor section of the <i>CloudWatch User Guide</i>.</p>', ], ], 'ResourceName' => [ 'base' => NULL, 'refs' => [ 'CreateMonitorInput$MonitorName' => '<p>The name of the monitor. </p>', 'DeleteMonitorInput$MonitorName' => '<p>The name of the monitor to delete.</p>', 'GetHealthEventInput$MonitorName' => '<p>The name of the monitor.</p>', 'GetMonitorInput$MonitorName' => '<p>The name of the monitor.</p>', 'GetMonitorOutput$MonitorName' => '<p>The name of the monitor.</p>', 'ListHealthEventsInput$MonitorName' => '<p>The name of the monitor.</p>', 'Monitor$MonitorName' => '<p>The name of the monitor.</p>', 'UpdateMonitorInput$MonitorName' => '<p>The name of the monitor. </p>', ], ], 'ResourceNotFoundException' => [ 'base' => '<p>The request specifies a resource that doesn\'t exist.</p>', 'refs' => [], ], 'RoundTripTime' => [ 'base' => '<p>Round-trip time (RTT) is how long it takes for a request from the user to return a response to the user. Amazon CloudWatch Internet Monitor calculates RTT at different percentiles: p50, p90, and p95.</p>', 'refs' => [ 'PerformanceMeasurement$RoundTripTime' => '<p>This is the percentage of how much round-trip time increased during the event compared to typical round-trip time for your application for traffic. </p> <p>For more information, see <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-IM-inside-internet-monitor.html#IMHealthEventStartStop">When Amazon Web Services creates and resolves health events</a> in the Amazon CloudWatch Internet Monitor section of the <i>CloudWatch User Guide</i>.</p>', ], ], 'S3Config' => [ 'base' => '<p>The configuration for publishing Amazon CloudWatch Internet Monitor internet measurements to Amazon S3. The configuration includes the bucket name and (optionally) prefix for the S3 bucket to store the measurements, and the delivery status. The delivery status is <code>ENABLED</code> or <code>DISABLED</code>, depending on whether you choose to deliver internet measurements to S3 logs.</p>', 'refs' => [ 'InternetMeasurementsLogDelivery$S3Config' => '<p>The configuration information for publishing Internet Monitor internet measurements to Amazon S3. The configuration includes the bucket name and (optionally) prefix for the S3 bucket to store the measurements, and the delivery status. The delivery status is <code>ENABLED</code> or <code>DISABLED</code>, depending on whether you choose to deliver internet measurements to S3 logs.</p>', ], ], 'S3ConfigBucketNameString' => [ 'base' => NULL, 'refs' => [ 'S3Config$BucketName' => '<p>The Amazon S3 bucket name.</p>', ], ], 'SetOfARNs' => [ 'base' => NULL, 'refs' => [ 'CreateMonitorInput$Resources' => '<p>The resources to include in a monitor, which you provide as a set of Amazon Resource Names (ARNs).</p> <p>You can add a combination of Amazon Virtual Private Clouds (VPCs) and Amazon CloudFront distributions, or you can add Amazon WorkSpaces directories. You can\'t add all three types of resources.</p> <note> <p>If you add only VPC resources, at least one VPC must have an Internet Gateway attached to it, to make sure that it has internet connectivity.</p> </note>', 'GetMonitorOutput$Resources' => '<p>The resources that have been added for the monitor. Resources are listed by their Amazon Resource Names (ARNs).</p>', 'UpdateMonitorInput$ResourcesToAdd' => '<p>The resources to include in a monitor, which you provide as a set of Amazon Resource Names (ARNs).</p> <p>You can add a combination of Amazon Virtual Private Clouds (VPCs) and Amazon CloudFront distributions, or you can add Amazon WorkSpaces directories. You can\'t add all three types of resources.</p> <note> <p>If you add only VPC resources, at least one VPC must have an Internet Gateway attached to it, to make sure that it has internet connectivity.</p> </note>', 'UpdateMonitorInput$ResourcesToRemove' => '<p>The resources to remove from a monitor, which you provide as a set of Amazon Resource Names (ARNs).</p>', ], ], 'String' => [ 'base' => NULL, 'refs' => [ 'AccessDeniedException$message' => NULL, 'BadRequestException$message' => NULL, 'ConflictException$message' => NULL, 'CreateMonitorInput$ClientToken' => '<p>A unique, case-sensitive string of up to 64 ASCII characters that you specify to make an idempotent API request. Don\'t reuse the same client token for other API requests.</p>', 'GetMonitorOutput$ProcessingStatusInfo' => '<p>Additional information about the health of the data processing for the monitor.</p>', 'ImpactedLocation$ASName' => '<p>The name of the network at an impacted location.</p>', 'ImpactedLocation$Country' => '<p>The name of the country where the health event is located.</p>', 'ImpactedLocation$Subdivision' => '<p>The subdivision location where the health event is located. The subdivision usually maps to states in most countries (including the United States). For United Kingdom, it maps to a country (England, Scotland, Wales) or province (Northern Ireland).</p>', 'ImpactedLocation$Metro' => '<p>The metro area where the health event is located.</p> <p>Metro indicates a metropolitan region in the United States, such as the region around New York City. In non-US countries, this is a second-level subdivision. For example, in the United Kingdom, it could be a county, a London borough, a unitary authority, council area, and so on.</p>', 'ImpactedLocation$City' => '<p>The name of the city where the health event is located.</p>', 'ImpactedLocation$CountryCode' => '<p>The country code where the health event is located. The ISO 3166-2 codes for the country is provided, when available. </p>', 'ImpactedLocation$SubdivisionCode' => '<p>The subdivision code where the health event is located. The ISO 3166-2 codes for country subdivisions is provided, when available. </p>', 'ImpactedLocation$ServiceLocation' => '<p>The service location where the health event is located.</p>', 'InternalServerErrorException$message' => NULL, 'InternalServerException$message' => NULL, 'LimitExceededException$message' => NULL, 'ListHealthEventsInput$NextToken' => '<p>The token for the next set of results. You receive this token from a previous call.</p>', 'ListHealthEventsOutput$NextToken' => '<p>The token for the next set of results. You receive this token from a previous call.</p>', 'ListMonitorsInput$NextToken' => '<p>The token for the next set of results. You receive this token from a previous call.</p>', 'ListMonitorsInput$MonitorStatus' => '<p>The status of a monitor. This includes the status of the data processing for the monitor and the status of the monitor itself.</p> <p>For information about the statuses for a monitor, see <a href="https://docs.aws.amazon.com/internet-monitor/latest/api/API_Monitor.html"> Monitor</a>.</p>', 'ListMonitorsOutput$NextToken' => '<p>The token for the next set of results. You receive this token from a previous call.</p>', 'Network$ASName' => '<p>The internet provider name or network name.</p>', 'NotFoundException$message' => NULL, 'ResourceNotFoundException$message' => NULL, 'S3Config$BucketPrefix' => '<p>The Amazon S3 bucket prefix.</p>', 'ThrottlingException$message' => NULL, 'TooManyRequestsException$message' => NULL, 'UpdateMonitorInput$ClientToken' => '<p>A unique, case-sensitive string of up to 64 ASCII characters that you specify to make an idempotent API request. You should not reuse the same client token for other API requests.</p>', 'ValidationException$message' => NULL, ], ], 'SyntheticTimestamp_date_time' => [ 'base' => NULL, 'refs' => [ 'GetHealthEventOutput$StartedAt' => '<p>The time when a health event started.</p>', 'GetHealthEventOutput$EndedAt' => '<p>The time when a health event was resolved. If the health event is still active, the end time is not set.</p>', 'GetHealthEventOutput$CreatedAt' => '<p>The time when a health event was created.</p>', 'GetHealthEventOutput$LastUpdatedAt' => '<p>The time when a health event was last updated or recalculated.</p>', 'GetMonitorOutput$CreatedAt' => '<p>The time when the monitor was created.</p>', 'GetMonitorOutput$ModifiedAt' => '<p>The last time that the monitor was modified.</p>', 'HealthEvent$StartedAt' => '<p>When a health event started.</p>', 'HealthEvent$EndedAt' => '<p>The time when a health event ended. If the health event is still active, then the end time is not set.</p>', 'HealthEvent$CreatedAt' => '<p>When the health event was created.</p>', 'HealthEvent$LastUpdatedAt' => '<p>When the health event was last updated.</p>', 'ListHealthEventsInput$StartTime' => '<p>The time when a health event started.</p>', 'ListHealthEventsInput$EndTime' => '<p>The time when a health event ended. If the health event is still ongoing, then the end time is not set.</p>', ], ], 'TagKey' => [ 'base' => NULL, 'refs' => [ 'TagKeys$member' => NULL, 'TagMap$key' => NULL, ], ], 'TagKeys' => [ 'base' => NULL, 'refs' => [ 'UntagResourceInput$TagKeys' => '<p>Tag keys that you remove from a resource.</p>', ], ], 'TagMap' => [ 'base' => NULL, 'refs' => [ 'CreateMonitorInput$Tags' => '<p>The tags for a monitor. You can add a maximum of 50 tags in Internet Monitor.</p>', 'GetMonitorOutput$Tags' => '<p>The tags that have been added to monitor.</p>', 'ListTagsForResourceOutput$Tags' => '<p>Tags for a resource.</p>', 'TagResourceInput$Tags' => '<p>Tags that you add to a resource. You can add a maximum of 50 tags in Internet Monitor.</p>', ], ], 'TagResourceInput' => [ 'base' => NULL, 'refs' => [], ], 'TagResourceOutput' => [ 'base' => NULL, 'refs' => [], ], 'TagValue' => [ 'base' => NULL, 'refs' => [ 'TagMap$value' => NULL, ], ], 'ThrottlingException' => [ 'base' => '<p>The request was denied due to request throttling.</p>', 'refs' => [], ], 'TooManyRequestsException' => [ 'base' => '<p>There were too many requests.</p>', 'refs' => [], ], 'TriangulationEventType' => [ 'base' => NULL, 'refs' => [ 'NetworkImpairment$NetworkEventType' => '<p>Type of network impairment.</p>', ], ], 'UntagResourceInput' => [ 'base' => NULL, 'refs' => [], ], 'UntagResourceOutput' => [ 'base' => NULL, 'refs' => [], ], 'UpdateMonitorInput' => [ 'base' => NULL, 'refs' => [], ], 'UpdateMonitorOutput' => [ 'base' => NULL, 'refs' => [], ], 'ValidationException' => [ 'base' => '<p>Invalid request.</p>', 'refs' => [], ], ],];
