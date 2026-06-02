# Go Web Application

This is a simple website written in Golang. It uses the `net/http` package to serve HTTP requests.

## Running the server

To run the server, execute the following command:

```bash
go run main.go
```

The server will start on port 8080. You can access it by navigating to `http://localhost:8080/courses` in your web browser.

## EKS cluster setup

To create the cluster from the repository root:

```powershell
# If eksctl is on PATH
eksctl create cluster --config-file cluster.yaml

# If eksctl is not on PATH, use the local executable path
C:\Users\ombas\eksctl_Windows_amd64\eksctl.exe create cluster --config-file cluster.yaml
```

Make sure your AWS credentials are configured and that the `eksctl` executable is available in your environment.

## Looks like this

![Website](static/images/golang-website.png)


