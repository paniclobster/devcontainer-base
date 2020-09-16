#!/usr/bin/env bash

set -e

# Configure docker socket
sudo tee /usr/local/share/copy-kube-config.sh >/dev/null \
    <<EOF
#!/usr/bin/env bash

if [ "\$SYNC_LOCALHOST_KUBECONFIG" = "true" ] && [ -d "/usr/local/share/kube-localhost" ]; then
    mkdir -p \$HOME/.kube
    sudo cp -r /usr/local/share/kube-localhost/* \$HOME/.kube
    sudo chown -R \$(id -u) \$HOME/.kube
    sed -i -e "s/localhost/host.docker.internal/g" \$HOME/.kube/config
    sed -i -e "s/127.0.0.1/host.docker.internal/g" \$HOME/.kube/config

    # If .minikube was mounted, set up client cert/key
    if [ -d "/usr/local/share/minikube-localhost" ]; then
        mkdir -p \$HOME/.minikube
        sudo cp -r /usr/local/share/minikube-localhost/ca.crt \$HOME/.minikube
        # Location varies between versions of minikube
        if [ -f "/usr/local/share/minikube-localhost/client.crt" ]; then
            sudo cp -r /usr/local/share/minikube-localhost/client.crt \$HOME/.minikube
            sudo cp -r /usr/local/share/minikube-localhost/client.key \$HOME/.minikube
        elif [ -f "/usr/local/share/minikube-localhost/profiles/minikube/client.crt" ]; then
            sudo cp -r /usr/local/share/minikube-localhost/profiles/minikube/client.crt \$HOME/.minikube
            sudo cp -r /usr/local/share/minikube-localhost/profiles/minikube/client.key \$HOME/.minikube
        fi
        sudo chown -R \$(id -u) \$HOME/.minikube

        # Point .kube/config to the correct locaiton of the certs
        sed -i -r "s|(\s*certificate-authority:\s).*|\\1\$HOME\/.minikube\/ca.crt|g" \$HOME/.kube/config
        sed -i -r "s|(\s*client-certificate:\s).*|\\1\$HOME\/.minikube\/client.crt|g" \$HOME/.kube/config
        sed -i -r "s|(\s*client-key:\s).*|\\1\$HOME\/.minikube\/client.key|g" \$HOME/.kube/config
    fi
fi
EOF

sudo chmod +x /usr/local/share/copy-kube-config.sh
sudo chown ${DEVCONTAINER_USERNAME}:root /usr/local/share/copy-kube-config.sh

echo "source /usr/local/share/copy-kube-config.sh" | sudo tee -a /root/.bashrc >>/home/${DEVCONTAINER_USERNAME}/.bashrc
chown ${DEVCONTAINER_USERNAME} /home/${DEVCONTAINER_USERNAME}/.bashrc

# Install Kubectl
curl --location --output kubectl --silent "https://storage.googleapis.com/kubernetes-release/release/$(curl --location --silent https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install kubectl /usr/local/bin/
sudo rm ./kubectl
