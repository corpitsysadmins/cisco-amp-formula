====
Cisco AMP for Endpoints
====

Formula to set up and configure the bind Cisco AMP connector. It's manageable using pillar values.

Example Pillar
==============

.. code:: yaml

    cisco_amp:
      use: True
      package_file: 'salt:///files/cisco_amp/your_policy_your-linux-versionfireamplinux_connector.rpm'


See *cisco_amp/pillar.example*.
