FROM ubuntu

RUN apt-get update \
    && apt-get install vim -y \
    && apt-get install curl git -y \
    && curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" \
    && mv kubectl /usr/bin && chmod +x /usr/bin/kubectl \
    && apt-get install python3 -y \
    && apt-get install python3-pip -y \
    && pip3 install awscli \
    && curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp \
    && mv /tmp/eksctl /usr/local/bin \
    && echo "alias k='kubectl'" >> ~/.bashrc \
    && echo "run() { git clone https://github.com/hashicorp/learn-terraform-provision-eks-cluster; }" >> ~/.bashrc \
    && echo "alias ts='terraform init && terraform plan -out testing -var region=us-east-1 && terraform apply testing'" >> ~/.bashrc

RUN mkdir -p ~/.kube \
    &&  curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 \
    && chmod 700 get_helm.sh \
    && ./get_helm.sh \
    && curl -LO https://github.com/kvaps/kubectl-node-shell/raw/master/kubectl-node_shell \
    && chmod +x ./kubectl-node_shell \
    && mv ./kubectl-node_shell /usr/local/bin/kubectl-node_shell \
    && apt-get install net-tools -y \
    &&  pip3 install boto3 \
    && apt-get install tmux -y \
    && apt-get install golang -y 


COPY script.sh /tmp/

RUN apt-get install telnet -y \
    && cat /tmp/script.sh  >> ~/.bashrc 


COPY terraform /bin/

COPY vimrc /root/.vimrc

CMD ["sleep","30000"]







