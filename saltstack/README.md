# saltstack-files

saltstack files for system configuraiton

## Saltstack standalong minion

###installation
```
curl -L https://bootstrap.saltstack.com -o bootstrap_salt.sh
sudo sh bootstrap_salt.sh
```

###configuraiton
Configuration file "/etc/salt/minion"
Setting file_client option to local;
Setting file_roots for using customized saltstack file path
```
file_client: local

file_roots:
    base:
       - /shared/git/saltstack-files
```

###Apply sate
```
salt-call --local state.apply [STATE_NAME]  [-l debug]
```

**reference**:
https://docs.saltstack.com/en/latest/topics/tutorials/quickstart.html