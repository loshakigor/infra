del module\server\config\ansible\hosts
echo [stage]>> module\server\config\ansible\hosts
cd client
terraform apply -auto-approve
terraform output prod1ip>> C:\source\infra\module\server\config\ansible\hosts
terraform output prod2ip>> C:\source\infra\module\server\config\ansible\hosts
cd ..
cd server
terraform apply -auto-approve
terraform output
pause 50
