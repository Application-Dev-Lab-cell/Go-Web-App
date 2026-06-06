# Go-Web-App
Complete Devops Implementation in one project ( **CICD Using Docker and Kubernetes** )

**Git + Docker + Kubernetes + Helm Application + Git actions + argo**

**Setp 1 : Install Visual Studio Application for coding.**
**Step 2 : Install Git** ( https://git-scm.com/install/windows) **and Go lang** ( https://go.dev/dl/ )**software and set-up accordingly** ( To validate the application locally )

**Clone the github repository :** 

git clone https://github.com/Application-Dev-Lab-cell/Go-Web-App.git 

<img width="1915" height="966" alt="image" src="https://github.com/user-attachments/assets/9fc4a2f0-cc1c-4eaf-b36e-c2d1bbd45db4" />

**Step 3: Install docker desktop and create the account if you dont have an account.**

Once docker setup was done successfully, create a docker file and build as **docker build -t <docker-username>/go-web-app:v0 .** with the latest tag. and then docker image will be generated. 

Once docker image was generated successfully the run the docker container  **docker run -p 8080:8080 -it nkr0209/go-web-app:v0** and access the URL http://localhost:8080/courses

**Docker Image :** <img width="1476" height="957" alt="image" src="https://github.com/user-attachments/assets/1e7cf567-9588-41ee-b476-ef79f585fd3b" /><img width="1486" height="126" alt="image" src="https://github.com/user-attachments/assets/486174e8-0b98-43af-a2ea-ece536ab7bb6" />

**Docker container :** <img width="1476" height="387" alt="image" src="https://github.com/user-attachments/assets/5af04ff9-191b-4560-a1a2-f88ae9c733f4" />

**Using Docker application loading :** <img width="1918" height="297" alt="image" src="https://github.com/user-attachments/assets/27d5964a-c14a-4fcc-a027-cb2b0f2438d3" />

**Step 4: Install kubectl tool** for working with kubernetes clusters and **eksctl tool** for working EKS Cluster and **AWS CLI tool** for working with AWS services.

Kubectl : nirha@NikhilKumar MINGW64 ~ $ curl -LO "https://dl.k8s.io/release/v1.30.0/bin/windows/amd64/kubectl.exe" ( add system variables accordingly )
eksctl : 

Install AWS CLI : Download and run the AWS CLI MSI installer for Windows (64-bit): **https://awscli.amazonaws.com/AWSCLIV2.msi**

Once above all installed You need to connect your local machine with aws cli account. For that you need to create  IAM role and generate the necessary keys to access it from local machine. 

PS C:\Users\nirha\Documents\GitHub Repos\go-web-app> aws configure (aws configure then give the keys as displayed in the cmd)

Now create the cluster so that you can run the kubernetes deployment service and ingress services accordingly. 

 To create cluster, **C:\Users\nirha\Documents\GitHub Repos\go-web-app\cluster.yaml**
 <img width="1490" height="950" alt="image" src="https://github.com/user-attachments/assets/c233193e-f22a-47d7-ae25-922a2588da2d" />
 **EKS Cluster Created successfully in aws account :**
 <img width="1557" height="288" alt="image" src="https://github.com/user-attachments/assets/275cadfa-74f5-42b0-8b12-63e5be32f311" />

**CloudFormation :**
 <img width="1578" height="390" alt="image" src="https://github.com/user-attachments/assets/e5e3fb9a-d2f4-4cf7-beb7-5386b5df74c5" />
**Elastic Ip address :** 
<img width="1613" height="247" alt="image" src="https://github.com/user-attachments/assets/1153a0a5-d636-4b5f-aec8-fa262e1b6572" />
**Auto scaling Groups:** 
<img width="1606" height="342" alt="image" src="https://github.com/user-attachments/assets/41363c26-58e7-4263-9db2-93bd10f02543" />

**Instances :** 
<img width="1596" height="382" alt="image" src="https://github.com/user-attachments/assets/eab277cf-cf10-4652-bfd2-cf081c0a6d7d" />
**Volumes:** 
<img width="1587" height="273" alt="image" src="https://github.com/user-attachments/assets/4b0c3c39-df9b-4f07-b40f-4dbe5a3691ee" />


Now we can apply kubectl for deployment.yaml, ingress.yaml and service.yaml files under k8s/manifests.

PS C:\Users\nirha\Documents\GitHub Repos\go-web-app> docker push nkr0209/go-web-app:v1
The push refers to repository [docker.io/nkr0209/go-web-app]

PS C:\Users\nirha\Documents\GitHub Repos\go-web-app> kubectl apply -f k8s/manifests/deployment.yaml
deployment.apps/go-web-app unchanged

PS C:\Users\nirha\Documents\GitHub Repos\go-web-app> kubectl get pods
NAME                         READY   STATUS    RESTARTS   AGE
go-web-app-7cc76c866-dx554   1/1     Running   0          12s

Note : Check the tag is correct or not if you get any imagepullbackoff issue.

PS C:\Users\nirha\Documents\GitHub Repos\go-web-app> kubectl apply -f k8s/manifests/ingress.yaml
ingress.networking.k8s.io/go-web-app created
PS C:\Users\nirha\Documents\GitHub Repos\go-web-app> kubectl get ing                            
NAME         CLASS   HOSTS              ADDRESS   PORTS   AGE
go-web-app   nginx   go-web-app.local             80      46s

PS C:\Users\nirha\Documents\GitHub Repos\go-web-app> kubectl apply -f k8s/manifests/service.yaml   
E0606 14:46:52.940190   11268 request.go:1196] "Unexpected error when reading response body" err="context deadline exceeded (Client.Timeout or context cancellation while reading body)"
service/go-web-app created
PS C:\Users\nirha\Documents\GitHub Repos\go-web-app> kubectl get svc
NAME         TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)   AGE
go-web-app   ClusterIP   10.100.152.136   <none>        80/TCP    54s
kubernetes   ClusterIP   10.100.0.1       <none>        443/TCP   70m

**PortNode to validate is working or not as expcted :** 

PS C:\Users\nirha\Documents\GitHub Repos\go-web-app> kubectl edit svc go-web-app
E0606 14:54:49.350513   19496 request.go:1196] "Unexpected error when reading response body" err="net/http: request canceled (Client.Timeout or context cancellation while reading body)"
service/go-web-app edited
PS C:\Users\nirha\Documents\GitHub Repos\go-web-app> 
PS C:\Users\nirha\Documents\GitHub Repos\go-web-app> kubectl get svc            
NAME         TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)        AGE
go-web-app   NodePort    10.100.152.136   <none>        80:**30763**/TCP   7m56s
kubernetes   ClusterIP   10.100.0.1       <none>        443/TCP        77m
PS C:\Users\nirha\Documents\GitHub Repos\go-web-app> kubectl get nodes -o wide  
NAME                             STATUS   ROLES    AGE   VERSION               INTERNAL-IP      EXTERNAL-IP     OS-IMAGE                        KERNEL-VERSION                    CONTAINER-RUNTIME
ip-192-168-10-123.ec2.internal   Ready    <none>   70m   v1.34.8-eks-3385e9b   192.168.10.123   **3.87.117.229**   Amazon Linux 2023.11.20260526   6.12.88-119.157.amzn2023.x86_64   containerd://2.2.3+unknown
ip-192-168-49-160.ec2.internal   Ready    <none>   70m   v1.34.8-eks-3385e9b   192.168.49.160   **32.195.56.246**   Amazon Linux 2023.11.20260526   6.12.88-119.157.amzn2023.x86_64   containerd://2.2.3+unknown

**Access the application using PORT Node ID with the external Ips as below :**  **URL : http://3.87.117.229:30763/courses**

<img width="1882" height="417" alt="image" src="https://github.com/user-attachments/assets/a704397d-9c8b-441c-a781-2d9b0908a095" />

**Note :** If application still not loading, you need to go to security group inside the aws account and under the eks nodegroup you can update the inboundtraffic for with your IP address using the port details. 

<img width="1586" height="373" alt="image" src="https://github.com/user-attachments/assets/f14af6ba-d6a4-4fa4-9a24-c8f7a2ee83d5" />


Step 5:  Install ingress controller to watch the ingress nginx server and creates the Load balancer accordingly.

PS C:\Users\nirha\Documents\GitHub Repos\go-web-app> kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.11.1/deploy/static/provider/aws/deploy.yaml
E0606 15:37:02.792694    2596 request.go:1196] "Unexpected error when reading response body" err="context deadline exceeded (Client.Timeout or context cancellation while reading body)"
namespace/ingress-nginx created
serviceaccount/ingress-nginx created
serviceaccount/ingress-nginx-admission created
role.rbac.authorization.k8s.io/ingress-nginx created
role.rbac.authorization.k8s.io/ingress-nginx-admission created
clusterrole.rbac.authorization.k8s.io/ingress-nginx created
clusterrole.rbac.authorization.k8s.io/ingress-nginx-admission created
rolebinding.rbac.authorization.k8s.io/ingress-nginx created
rolebinding.rbac.authorization.k8s.io/ingress-nginx-admission created
clusterrolebinding.rbac.authorization.k8s.io/ingress-nginx created
clusterrolebinding.rbac.authorization.k8s.io/ingress-nginx-admission created
configmap/ingress-nginx-controller created
service/ingress-nginx-controller created
service/ingress-nginx-controller-admission created
deployment.apps/ingress-nginx-controller created
job.batch/ingress-nginx-admission-create created
job.batch/ingress-nginx-admission-patch created
ingressclass.networking.k8s.io/nginx created
validatingwebhookconfiguration.admissionregistration.k8s.io/ingress-nginx-admission created
PS C:\Users\nirha\Documents\GitHub Repos\go-web-app> 

PS C:\Users\nirha\Documents\GitHub Repos\go-web-app> kubectl get pods -n ingress-nginx
NAME                                        READY   STATUS      RESTARTS   AGE
ingress-nginx-admission-create-skqwk        0/1     Completed   0          2m36s
ingress-nginx-admission-patch-bd2gw         0/1     Completed   0          2m35s
ingress-nginx-controller-6fb6bc46cb-cjr7z   1/1     Running     0          2m38s

PS C:\Users\nirha\Documents\GitHub Repos\go-web-app> kubectl get svc -n ingress-nginx
NAME                                 TYPE           CLUSTER-IP      EXTERNAL-IP                                                                     PORT(S)                      AGE
ingress-nginx-controller             LoadBalancer   10.100.93.244   aea02eb9adabc4018b447567e01df3fa-b7fd93680ba2e15a.elb.us-east-1.amazonaws.com   80:31686/TCP,443:30207/TCP   3m13s
ingress-nginx-controller-admission   ClusterIP      10.100.10.70    <none>                                                                          443/TCP                      3m12s

PS C:\Users\nirha\Documents\GitHub Repos\go-web-app> kubectl get ing                 
NAME         CLASS   HOSTS              ADDRESS                                                                         PORTS   AGE
go-web-app   nginx   go-web-app.local   aea02eb9adabc4018b447567e01df3fa-b7fd93680ba2e15a.elb.us-east-1.amazonaws.com   80      54m
PS C:\Users\nirha\Documents\GitHub Repos\go-web-app> 

**Loadbalancer :**
<img width="1613" height="315" alt="image" src="https://github.com/user-attachments/assets/849c7467-bdab-46b8-bbe6-17edad470052" />

Generally we can access the application with address aea02eb9adabc4018b447567e01df3fa-b7fd93680ba2e15a.elb.us-east-1.amazonaws.com but since in ingress we have mentioned only if url is go-web-app.local then only requests needs to be accessible. So now we need to map the hosts with the ip address of the load balancer.

PS C:\Users\bhara\Downloads\go-web-app\go-web-app> nslookup aea02eb9adabc4018b447567e01df3fa-b7fd93680ba2e15a.elb.us-east-1.amazonaws.com
Server:  hyd-tdc-bngs-23
Address:  110.235.231.77

Non-authoritative answer:
Name:    aea02eb9adabc4018b447567e01df3fa-b7fd93680ba2e15a.elb.us-east-1.amazonaws.com
Addresses:  54.80.251.231
          98.82.252.241

Once we get the IPaddress for the load balancer address then need to do the DNS mapping with it. in file path 
PS C:\Users\nirha\Documents\GitHub Repos\go-web-app> sudo vim etc/hosts ( It will fail in windows, so you can update this file using linux
 or dirctly from the windows path. ( C:\Windows\System32\drivers\etc/hosts)  

 Include this line in that file : 54.80.251.231   go-web-app.local

 Once you save the changes access the url : http://go-web-app.local/courses or http://go-web-app.local/home or http://go-web-app.local/author
 <img width="1916" height="947" alt="image" src="https://github.com/user-attachments/assets/35585293-d6d8-423a-a502-781f5c194688" />

Step 6: To install Heml Application : 

PS C:\Users\nirha\Documents\GitHub Repos\go-web-app> helm version
version.BuildInfo{Version:"v4.2.0", GitCommit:"06468084e85c244c712834933d25ea232a4c2093", GitTreeState:"clean", GoVersion:"go1.26.3", KubeClientVersion:"v1.36"}

PS C:\Users\nirha\Documents\GitHub Repos\go-web-app\helm\go-web-app-chart> rmdir templates 

Confirm
The item at C:\Users\nirha\Documents\GitHub Repos\go-web-app\helm\go-web-app-chart\templates has children and the Recurse parameter was not specified. 
If you continue, all children will be removed with the item. Are you sure you want to continue?
[Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "Y"): Y
PS C:\Users\nirha\Documents\GitHub Repos\go-web-app\helm\go-web-app-chart>


PS C:\Users\nirha\Documents\GitHub Repos\go-web-app\helm\go-web-app-chart> mkdir templates


    Directory: C:\Users\nirha\Documents\GitHub Repos\go-web-app\helm\go-web-app-chart


Mode                 LastWriteTime         Length Name                                                                                                 
----                 -------------         ------ ----                                                                                                 
d-----        06-06-2026     17:19                templates

PS C:\Users\nirha\Documents\GitHub Repos\go-web-app\helm\go-web-app-chart\templates> cp ../../../k8s/manifests/* .
PS C:\Users\nirha\Documents\GitHub Repos\go-web-app\helm\go-web-app-chart\templates> kubectl get all
NAME                             READY   STATUS    RESTARTS   AGE
pod/go-web-app-7cc76c866-dx554   1/1     Running   0          171m

NAME                 TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)        AGE
service/go-web-app   NodePort    10.100.152.136   <none>        80:30763/TCP   169m
service/kubernetes   ClusterIP   10.100.0.1       <none>        443/TCP        3h58m

NAME                         READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/go-web-app   1/1     1            1           3h27m

NAME                                   DESIRED   CURRENT   READY   AGE
replicaset.apps/go-web-app-7cc76c866   1         1         1       3h27m
PS C:\Users\nirha\Documents\GitHub Repos\go-web-app\helm\go-web-app-chart\templates> 

PS C:\Users\nirha\Documents\GitHub Repos\go-web-app\helm\go-web-app-chart\templates> kubectl delete deploy go-web-app
deployment.apps "go-web-app" deleted from default namespace
PS C:\Users\nirha\Documents\GitHub Repos\go-web-app\helm\go-web-app-chart\templates> kubectl delete ing go-web-app   
ingress.networking.k8s.io "go-web-app" deleted from default namespace
PS C:\Users\nirha\Documents\GitHub Repos\go-web-app\helm\go-web-app-chart\templates> kubectl delete svc go-web-app
service "go-web-app" deleted from default namespace
PS C:\Users\nirha\Documents\GitHub Repos\go-web-app\helm\go-web-app-chart\templates> kubectl get all                 
NAME                 TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)   AGE
service/kubernetes   ClusterIP   10.100.0.1   <none>        443/TCP   4h3m

PS C:\Users\nirha\Documents\GitHub Repos\go-web-app\helm> helm install go-web-app ./go-web-app-chart
NAME: go-web-app
LAST DEPLOYED: Sat Jun  6 17:49:01 2026
NAMESPACE: default
STATUS: deployed
REVISION: 1
DESCRIPTION: Install complete
TEST SUITE: None

PS C:\Users\nirha\Documents\GitHub Repos\go-web-app\helm> kubectl get all                           
NAME                             READY   STATUS    RESTARTS   AGE
pod/go-web-app-7cc76c866-cdrvp   1/1     Running   0          46s

NAME                 TYPE        CLUSTER-IP    EXTERNAL-IP   PORT(S)   AGE
service/go-web-app   ClusterIP   10.100.8.77   <none>        80/TCP    46s
service/kubernetes   ClusterIP   10.100.0.1    <none>        443/TCP   4h12m

NAME                         READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/go-web-app   1/1     1            1           49s

NAME                                   DESIRED   CURRENT   READY   AGE
replicaset.apps/go-web-app-7cc76c866   1         1         1       49s
PS C:\Users\nirha\Documents\GitHub Repos\go-web-app\helm> 



