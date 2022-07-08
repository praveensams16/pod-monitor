Image Change 
####

Image covers kubectl , terraform and golang . Please comment unwanted installation in Dockefile to reduce image size

####

Chart Change 

Please make sure to change the image name in the value file 

Also its designed to be called only over service level , enable ingress in chart so that it can be called over public ( not recommended )


####

For security reason , the pod is designed to get the metrics only on the namespace on which its been deployed


Example 

root@e0b9d1158027:/# k get pods
NAME                              READY   STATUS             RESTARTS   AGE
sam-7d48dd8f5d-5vcj7              0/1     CrashLoopBackOff   33         146m
sam-pod-monitor-dd5595875-c9wks   1/1     Running            0          63m
sam1-58786d8c98-j9hzh             0/1     CrashLoopBackOff   33         145m
sty-85d8797b86-82bn2              1/1     Running            0          126m




output

root@sty-85d8797b86-82bn2:/usr/local/apache2# curl sam-pod-monitor.default/metrics

status_pod{pod="sam-7d48dd8f5d-5vcj7",status="CrashLoopBackOff"} 0
status_pod{pod="sam-pod-monitor-dd5595875-c9wks",status="Running"}  1
status_pod{pod="sam1-58786d8c98-j9hzh",status="CrashLoopBackOff"} 0
status_pod{pod="sty-85d8797b86-82bn2",status="Running"}  1


From the above output you will get all the pod status on single job scraper
