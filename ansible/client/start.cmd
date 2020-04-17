del C:\source\infra\terraform\modules\server\config\hosts
terraform apply -auto-approve
echo [stage]>> C:\source\infra\terraform\modules\server\config\hosts
terraform output stageip >>c:\source\infra\terraform\modules\server\config\hosts
terraform output progip >>c:\source\infra\terraform\modules\server\config\hosts
pause 5