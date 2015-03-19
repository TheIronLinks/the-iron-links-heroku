task create_real_employers: :environment do
  Employer.all.each do |employer|
    employer.destroy
  end
  
    Employer.create!({
      name: 'BenefitFocus',
      image_url: 'http://www.mitcio.com/sites/default/files/imagecache/gold_sponsor/benefitfocus.jpg',
      # bio: 'Benefitfocus is a leading provider of benefits technology. More than 23 million consumers manage all types of benefits in the Benefitfocus Cloud. By delivering technology that integrates all benefits in one place, Benefitfocus provides a better way to engage consumers, educate employees and simplify benefit enrollment and management.',
      industry: 'Software Provider',
      size: '1200',
      founded: '1998',
      city: 'Charleston',
      state: 'SC',
      locations: [
        Location.create!({
          city: 'Charleston',
          state: 'SC',
          zip: '29406',
          description: 'test1',
          job_listings: [
            JobListing.create!({
              name: 'test1',
              position: 'test1',
              description: 'test1',
              post_date: 'test1'
            }),
            JobListing.create!({
              name: 'test2',
              position: 'test2',
              description: 'test2',
              post_date: 'test2'
            })
          ]
        }),
        Location.create!({
          city: 'Charleston',
          state: 'SC',
          zip: '29406',
          description: 'test2',
          job_listings: [
            JobListing.create!({
              name: 'test1',
              position: 'test1',
              description: 'test1',
              post_date: 'test1'
            }),
            JobListing.create!({
              name: 'test2',
              position: 'test2',
              description: 'test2',
              post_date: 'test2'
            })
          ]
        })
      ]
    })
    Employer.create!({
      name: 'Jack Russell Software',
      image_url: 'http://www.jackrussellsoftware.com/images/jackhq-logo.png',
      # bio: 'At JRS, we have 6 development teams. Each team uses a different technology stack for its product line. Every stack must communicate via http/json api, which provides a rich integration amongst the technologies. Over time, we will continue to add new technology, but we also strive to be very selective to keep the on boarding of developers as efficient as possible.',
      industry: 'Software Provider',
      size: '58',
      founded: '2004',
      city: 'Charleston',
      state: 'SC',
      locations: [
        Location.create!({
          city: 'Charleston',
          state: 'SC',
          zip: '29406',
          description: 'test1',
          job_listings: [
            JobListing.create!({
              name: 'test1',
              position: 'test1',
              description: 'test1',
              post_date: 'test1'
            }),
            JobListing.create!({
              name: 'test2',
              position: 'test2',
              description: 'test2',
              post_date: 'test2'
            })
          ]
        }),
        Location.create!({
          city: 'Charleston',
          state: 'SC',
          zip: '29406',
          description: 'test2',
          job_listings: [
            JobListing.create!({
              name: 'test1',
              position: 'test1',
              description: 'test1',
              post_date: 'test1'
            }),
            JobListing.create!({
              name: 'test2',
              position: 'test2',
              description: 'test2',
              post_date: 'test2'
            })
          ]
        })
      ]
    })
    Employer.create!({
      name: 'CreateSpace',
      image_url: 'http://scribeworks.ca/wp-content/uploads/2011/04/CreateSpace-Logo.jpg',
      # bio: 'The publishing industry is evolving. Hundreds of thousands of authors like you are publishing profitable work right now instead of waiting for agents and publishers to give the green light.
        # With CreateSpace you can easily access tools, quality printing, booksellers, eBook distribution, and marketing strategies so that you can generate more opportunities than you imagined – all while building your following of readers.',
      industry: 'On-Demand Publishing',
      size: '350',
      founded: '2001',
      city: 'North Charleston',
      state: 'SC',
      locations: [
        Location.create!({
          city: 'Charleston',
          state: 'SC',
          zip: '29406',
          description: 'test1',
          job_listings: [
            JobListing.create!({
              name: 'test1',
              position: 'test1',
              description: 'test1',
              post_date: 'test1'
            }),
            JobListing.create!({
              name: 'test2',
              position: 'test2',
              description: 'test2',
              post_date: 'test2'
            })
          ]
        }),
        Location.create!({
          city: 'Charleston',
          state: 'SC',
          zip: '29406',
          description: 'test2',
          job_listings: [
            JobListing.create!({
              name: 'test1',
              position: 'test1',
              description: 'test1',
              post_date: 'test1'
            }),
            JobListing.create!({
              name: 'test2',
              position: 'test2',
              description: 'test2',
              post_date: 'test2'
            })
          ]
        })
      ]
    })
    Employer.create!({
      name: 'SPARC',
      image_url: 'http://www.sparcedge.com/wp-content/uploads/2013/10/sparc-logo-blog.png',
      # bio: 'SPARC is a software product development company creating engaging, forward-thinking technology while keeping Team Members at the core of everything we do. With offices in Charleston, South Carolina and Washington, D.C., SPARC provides software development services for the government and commercial sectors, and develops commercial software products for the executive leadership, human resources, big data analytics, and mobile markets. In 2013, SPARC was ranked by Inc. 500 as the 14th fastest-growing private company in the U.S.',
      industry: 'Software Provider',
      size: '225',
      founded: '2006',
      city: 'Charleston',
      state: 'SC',
      locations: [
        Location.create!({
          city: 'Charleston',
          state: 'SC',
          zip: '29406',
          description: 'test1',
          job_listings: [
            JobListing.create!({
              name: 'test1',
              position: 'test1',
              description: 'test1',
              post_date: 'test1'
            }),
            JobListing.create!({
              name: 'test2',
              position: 'test2',
              description: 'test2',
              post_date: 'test2'
            })
          ]
        }),
        Location.create!({
          city: 'Charleston',
          state: 'SC',
          zip: '29406',
          description: 'test2',
          job_listings: [
            JobListing.create!({
              name: 'test1',
              position: 'test1',
              description: 'test1',
              post_date: 'test1'
            }),
            JobListing.create!({
              name: 'test2',
              position: 'test2',
              description: 'test2',
              post_date: 'test2'
            })
          ]
        })
      ]
    })
    Employer.create!({
      name: 'Blue Acorn',
      image_url: 'http://d13yacurqjgara.cloudfront.net/users/49203/avatars/normal/Untitled-1.png',
      # bio: 'Blue Acorn is a full service eCommerce agency, and we have gone to great lengths to recruit experts for every piece of the eCommerce success puzzle. Our clients don’t have to go to one company for design, another for development, another for marketing, and another for optimization. They have us. While we do take on clients that just need help in a particular area, we enjoy the opportunity to utilize our collective skillset in helping online retailers grow.',
      industry: 'Software Provider',
      size: '87',
      founded: '2008',
      city: 'Indianapolis',
      state: 'IN',
      locations: [
        Location.create!({
          city: 'Charleston',
          state: 'SC',
          zip: '29406',
          description: 'test1',
          job_listings: [
            JobListing.create!({
              name: 'test1',
              position: 'test1',
              description: 'test1',
              post_date: 'test1'
            }),
            JobListing.create!({
              name: 'test2',
              position: 'test2',
              description: 'test2',
              post_date: 'test2'
            })
          ]
        }),
        Location.create!({
          city: 'Charleston',
          state: 'SC',
          zip: '29406',
          description: 'test2',
          job_listings: [
            JobListing.create!({
              name: 'test1',
              position: 'test1',
              description: 'test1',
              post_date: 'test1'
            }),
            JobListing.create!({
              name: 'test2',
              position: 'test2',
              description: 'test2',
              post_date: 'test2'
            })
          ]
        })
      ]
    })
    Employer.create!({
      name: 'McDonalds',
      image_url: 'http://img1.wikia.nocookie.net/__cb20100717060808/logopedia/images/a/a9/Mcdonalds-90s-logo.svg',
      # bio: 'The McDonalds Corporation is the largest chain of hamburger fast food restaurants in the world, serving around 68 million customers daily in 119 countries across 35,000 outlets.  Headquartered in the United States, the company began in 1940 as a barbecue restaurant operated by Richard and Maurice McDonald.  In 1948, they reorganized their business as a hamburger stand using production line principles. Businessman Ray Kroc joined the company as a franchise agent in 1955. He subsequently purchased the chain from the McDonald brothers and oversaw its worldwide growth.',
      industry: 'Fast Food Provider',
      size: '450000',
      founded: '1956',
      city: 'Charleston',
      state: 'SC',
      locations: [
        Location.create!({
          city: 'Charleston',
          state: 'SC',
          zip: '29406',
          description: 'test1',
          job_listings: [
            JobListing.create!({
              name: 'test1',
              position: 'test1',
              description: 'test1',
              post_date: 'test1'
            }),
            JobListing.create!({
              name: 'test2',
              position: 'test2',
              description: 'test2',
              post_date: 'test2'
            })
          ]
        }),
        Location.create!({
          city: 'Charleston',
          state: 'SC',
          zip: '29406',
          description: 'test2',
          job_listings: [
            JobListing.create!({
              name: 'test1',
              position: 'test1',
              description: 'test1',
              post_date: 'test1'
            }),
            JobListing.create!({
              name: 'test2',
              position: 'test2',
              description: 'test2',
              post_date: 'test2'
            })
          ]
        })
      ]
    })
    Employer.create!({
      name: 'BoomTown!',
      image_url: 'http://geekestateblog.com/wp-content/uploads/2014/09/boomtown-logo_large.jpg',
      # bio: 'The top real estate brokerages trust us to help them close more deals and grow their business. They love helping people find their way home and we love helping them do it. Whether you’re overloaded trying to do it all on your own, or trying to find a way to connect multiple teams and offices, BoomTown has the software and services to solve it. 
        # With one system you’re covered from first click to closing. We attract leads to your site and help you get to know them. Automated marketing tools make building relationships simple and predictive intelligence gives you insight you can act on. We take the guesswork out of managing your team and put data in its place: at your fingertips. We’re more than software and data though. We’re here at every step with proven strategies and support, so you can work on your business instead of in it.',
      industry: 'Software Provider',
      size: '150',
      founded: '2006',
      city: 'Greenville',
      state: 'SC',
      locations: [
        Location.create!({
          city: 'Charleston',
          state: 'SC',
          zip: '29406',
          description: 'test1',
          job_listings: [
            JobListing.create!({
              name: 'test1',
              position: 'test1',
              description: 'test1',
              post_date: 'test1'
            }),
            JobListing.create!({
              name: 'test2',
              position: 'test2',
              description: 'test2',
              post_date: 'test2'
            })
          ]
        }),
        Location.create!({
          city: 'Charleston',
          state: 'SC',
          zip: '29406',
          description: 'test2',
          job_listings: [
            JobListing.create!({
              name: 'test1',
              position: 'test1',
              description: 'test1',
              post_date: 'test1'
            }),
            JobListing.create!({
              name: 'test2',
              position: 'test2',
              description: 'test2',
              post_date: 'test2'
            })
          ]
        })
      ]
    })
    Employer.create!({
      name: 'Catalytics Data Science',
      image_url: 'http://www.catalyticds.com/img/catalyticds_logo.png',
      # bio: 'Catalytic Data Science develops cloud solutions that enable researchers to utilize biomedical information that is otherwise locked in vast repositories of "read only" scientific publications. Our mission is to make the lives of scientists better and more productive by developing tools that accelerate their research and development activities and speed innovation.',
      industry: 'Software Provider',
      size: '85',
      founded: '2008',
      city: 'Greenville',
      state: 'SC',
      locations: [
        Location.create!({
          city: 'Charleston',
          state: 'SC',
          zip: '29406',
          description: 'test1',
          job_listings: [
            JobListing.create!({
              name: 'test1',
              position: 'test1',
              description: 'test1',
              post_date: 'test1'
            }),
            JobListing.create!({
              name: 'test2',
              position: 'test2',
              description: 'test2',
              post_date: 'test2'
            })
          ]
        }),
        Location.create!({
          city: 'Charleston',
          state: 'SC',
          zip: '29406',
          description: 'test2',
          job_listings: [
            JobListing.create!({
              name: 'test1',
              position: 'test1',
              description: 'test1',
              post_date: 'test1'
            }),
            JobListing.create!({
              name: 'test2',
              position: 'test2',
              description: 'test2',
              post_date: 'test2'
            })
          ]
        })
      ]
    })
    Employer.create!({
      name: 'PhishLabs',
      image_url: 'https://pbs.twimg.com/profile_images/1170138938/PL_Logo_Graphic_400x400.PNG',
      # bio: 'PhishLabs is the leading provider of cybercrime protection and intelligence services that fight back against online threats and reduce the risk posed by phishing, malware, distributed denial of service (DDoS) and other cyber attacks.',
      industry: 'Software Provider',
      size: '220',
      founded: '2004',
      city: 'Charleston',
      state: 'SC',
      locations: [
        Location.create!({
          city: 'Charleston',
          state: 'SC',
          zip: '29406',
          description: 'test1',
          job_listings: [
            JobListing.create!({
              name: 'test1',
              position: 'test1',
              description: 'test1',
              post_date: 'test1'
            }),
            JobListing.create!({
              name: 'test2',
              position: 'test2',
              description: 'test2',
              post_date: 'test2'
            })
          ]
        }),
        Location.create!({
          city: 'Charleston',
          state: 'SC',
          zip: '29406',
          description: 'test2',
          job_listings: [
            JobListing.create!({
              name: 'test1',
              position: 'test1',
              description: 'test1',
              post_date: 'test1'
            }),
            JobListing.create!({
              name: 'test2',
              position: 'test2',
              description: 'test2',
              post_date: 'test2'
            })
          ]
        })
      ]
    })
    Employer.create!({
      name: 'Blackbaud',
      image_url: 'http://halsey.cofc.edu/wp-content/files_mf/cache/th_786a15f2a09f58bf421d59fa1c1c028e_screenshot20130920at2.43.03pm.png',
      # bio: 'Blackbaud Inc. is a supplier of software and services specifically designed for nonprofit organizations. Its products focus on fundraising, website management, CRM, analytics, financial management, ticketing, and education administration.',
      industry: 'Software Provider',
      size: '2600',
      founded: '1981',
      city: 'Charleston',
      state: 'SC',
      locations: [
        Location.create!({
          city: 'Charleston',
          state: 'SC',
          zip: '29406',
          description: 'test1',
          job_listings: [
            JobListing.create!({
              name: 'test1',
              position: 'test1',
              description: 'test1',
              post_date: 'test1'
            }),
            JobListing.create!({
              name: 'test2',
              position: 'test2',
              description: 'test2',
              post_date: 'test2'
            })
          ]
        }),
        Location.create!({
          city: 'Charleston',
          state: 'SC',
          zip: '29406',
          description: 'test2',
          job_listings: [
            JobListing.create!({
              name: 'test1',
              position: 'test1',
              description: 'test1',
              post_date: 'test1'
            }),
            JobListing.create!({
              name: 'test2',
              position: 'test2',
              description: 'test2',
              post_date: 'test2'
            })
          ]
        })
      ]
    })  
  puts "10 employers created, booyah!"
end