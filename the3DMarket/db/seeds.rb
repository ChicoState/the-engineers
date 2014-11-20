# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create([
          {
            username: 'test',
            email: 'jkrepelka@mail.csuchico.edu',
            # Password is 'test'
            # Use PasswordHashInstead
            hash_pass: 'sha1:1000:cl5sCqliuaRUbrlan7aL6fPTd8+HoF6c:ieq/oH3JRrymZ1gnz7f1x68eGTio54p4',
            last_log: Time.now
          },
          {
            username: 'face',
            email: 'jkrepelka@mail.csuchico.edu',
            # Password is 'face'
            # Use PasswordHashInstead
            hash_pass: 'sha1:1000:9ua7zzeYWzKkbzI1pEe35EbGvLJZgZFv:b60DK8LZX3juGjf6Z5+vJ1fN1CJEc6Hn',
            last_log: Time.now
          }
        ])

licenses = License.create([
          {
            title: 'GPLv3',
            sdesc: 'Shit we need to avoid',
            filepath:'./bad_path'
          },
          {
            title: 'Testing License',
            sdesc: 'Open everything for everyone',
            filepath: './bad_path'
          }
        ])

designs = Design.create([
          {
            title: 'A 3D Tree',
            sdesc: 'So tree-like',
            filepath: './bad_path',
            imagefilepath: './bad_path',
            user_id: users[0].id,
            license_id: licenses[0].id
          },
          {
            title: 'A 3D Gun',
            sdesc: 'Care care',
            filepath: './bad_path',
            imagefilepath: './bad_path',
            user_id: users[1].id,
            license_id: licenses[1].id
          }
        ])
