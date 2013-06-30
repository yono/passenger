passenger Cookbook
==================
Install passenger gem with rbenv and add conf file to Apache2.

Requirements
------------

#### Platform

This cookbook is tested on Ubuntu 12.04.

- ubuntu
- debian

#### packages
- rbenv : https://github.com/fnichol/chef-rbenv
- build-essential

Attributes
----------

#### passenger
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['passenger']['version']</tt></td>
    <td>String</td>
    <td>Passeger version</td>
    <td><tt>4.0.2</tt></td>
  </tr>
  <tr>
    <td><tt>['passenger']['apache2']['conf']</tt></td>
    <td>String</td>
    <td>Apache2 configure file</td>
    <td><tt>/etc/apache2/conf.d/passenger.conf</tt></td>
  </tr>
</table>

Usage
-----
#### passenger

Just include `passenger` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[passenger]"
  ]
}
```

Contributing
------------

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

