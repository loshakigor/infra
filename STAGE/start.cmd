del module\server\config\hosts
echo [stage]>> module\server\config\hosts
cd client
terraform apply -auto-approve
terraform output prod1ip>> C:\source\infra\STAGE\module\server\config\hosts
terraform output prod2ip>> C:\source\infra\STAGE\module\server\config\hosts
cd ..
cd server
terraform apply -auto-approve
terraform output
pause 50
