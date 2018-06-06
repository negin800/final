User.delete_all
host0 = User.create name: 'Donald Trump', email: 'dt@aol.com', password_digest: BCrypt::Password.create('iamthebest'), pets:'donkey,horse', is_host: true
host1 = User.create name: 'Barack Obama', email: 'barack@gmail.com', password_digest: BCrypt::Password.create('makenomistake'), pets:'dog,cat', is_host: true
host2 = User.create name: 'George Bush', email: 'gwb@yahoo.com', password_digest: BCrypt::Password.create('711', pets:'dog'), is_host: true
host3 = User.create name: 'Bill Clinton', email: 'bill@hotmail.com', password_digest: BCrypt::Password.create('monicamonica'), pets:'bunny,squirrel', is_host: true

Posting.delete_all
Posting.create title: 'Super amazing huge donkey friendly house', price: 400000,
            host_id: host0.id,
            location: "New York, NY",
            photo_url: 'https://qz.com/wp-content/uploads/2016/09/ap16225629735059-e1475183363331.jpg',
            summary: "Make America great again by bringing your pet to the most american house ever."

Posting.create title: 'Super deal', price: 100, 
            host_id: host1.id,
            location: "Chicago, IL",
            photo_url: 'http://www.msnbc.com/sites/msnbc/files/styles/embedded_image/public/gettyimages-85980006.jpg',
            summary: "Family oriented house that can provide a lot of love to your pet. 8 years of experience."
            
Posting.create title: 'Bring your pet here. Zero down with zero interest', price: 3000,
            host_id: host2.id,
            location: "New Haven, CT",
            photo_url: 'http://www.iment.com/maida/familytree/cousins/georgebush/images/bushholdingbarneyupright-2.jpg',
            summary: "Get a loan now..."
            
Posting.create title: 'I will love your pet as much as I love my wife', price: 1500,
            host_id: host3.id,
            location: "Hope, AR",
            photo_url: "http://i0.kym-cdn.com/photos/images/newsfeed/001/244/605/e26.jpg",
            summary: "I love bunnies"

Booking.delete_all
print "There are now #{User.count} hosts in the database.\n"
print "There are now #{Posting.count} postings in the database.\n"
