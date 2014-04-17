#encoding: utf-8

categories = [
  {
    name: 'Level 1'
  },
  {
    name: 'Level 2'
  },
  {
    name: 'Educator Innovator'
  }
]

categories.each do |category|
  Category.create category
end

level_one = Category.find_by_name 'Level 1'
level_two = Category.find_by_name 'Level 2'
ei = Category.find_by_name 'Educator Innovator'

badges = [
  { 
    name: 'Member',
    description: "This badge is awarded to Educator Innovators who’ve subscribed to the Educator Innovator blog.",
    claimcode: true,
    category: level_one
  },
  { 
    name: 'Explorer',
    description: "This badge is awarded to Educator Innovators who’ve participated in an Educator Innovator learning opportunity offered at the Educator Innovator site or at partner sites.",
    claimcode: true,
    category: level_one
  },
  { 
    name: 'Promoter',
    description: "This badge is awarded to Educator Innovators who’ve shown they know how to spread the word about the Educator Innovator Network, its partners and collaborators and its Connected Learning-related opportunities.",
    category: level_one
  },
  { 
    name: 'Networker',
    description: "This badge is awarded to Educator Innovators who’ve collaborated with others in the network.",
    category: level_one
  },
  {
    name: 'Facilitator', 
    description: "This badge is awarded to Educator Innovators who’ve facilitated a learning experience that evidences Connected Learning principles in action or in theory, either at the Educator Innovator site, at partner sites or face to face.",
    category: level_two
  },
  { 
    name: 'Maker',
    description: "This badge is awarded to Educator Innovators who’ve produced Connected Learning-based resources, events, curriculum or created artifacts as part of a making event organized by the Educator Innovator site or by partners and collaborators.",
    category: level_two
  },
  { 
    name: 'Advocate',
    description: "This badge is awarded to Educator Innovators who’ve advocated for production-centered, peer-supported, interest driven learning opportunities in their educational context, in their community and/or in online spaces.",
    category: level_two
  },
  { 
    name: 'Designer',
    description: "This badge is awarded to Educator Innovators who’ve implemented a learning opportunity for the young people they work with that is designed with Connected Learning principles in mind.",
    category: level_two
  },
  { 
    name: 'Educator Innovator',
    description: 'Educator Innovator',
    category: ei
  }
]

badges.each do |badge|
  Badge.create badge
end