# Clear existing records
puts "Destroying existing records..."
User.destroy_all
App.destroy_all
Ticket.destroy_all
AppUser.destroy_all
Template.destroy_all
UserGroup.destroy_all

# Create user groups
puts "Creating user groups..."
support_group = UserGroup.create!(name: 'Support')
it_technician_group = UserGroup.create!(name: 'IT technician')
administration_group = UserGroup.create!(name: 'Administration')

# Create users
puts "Creating users..."
user1 = User.create!(
  email: 'user1@example.com',
  password: 'password123',
  first_name: 'User',
  last_name: 'One',
  username: 'userone',
  phone: '1234567890',
  role: 'administrator',
  user_group: support_group
)

user2 = User.create!(
  email: 'user2@example.com',
  password: 'password123',
  first_name: 'User',
  last_name: 'Two',
  username: 'usertwo',
  phone: '0987654321',
  role: 'user',
  user_group: it_technician_group
)

# Attach avatars
user1.avatar.attach(
  io: File.open(Rails.root.join('db', 'seeds', 'avatars', 'user1.jpg')),
  filename: 'user1.jpg',
  content_type: 'image/jpeg'
)

user2.avatar.attach(
  io: File.open(Rails.root.join('db', 'seeds', 'avatars', 'user2.jpg')),
  filename: 'user2.jpg',
  content_type: 'image/jpeg'
)

# Create apps
puts "Creating apps..."
app1 = App.create!(
  domain: 'app1.example.com',
  user_name: 'appuser1',
  company_name: 'Company One',
  work_hours: '9-5'
)

app2 = App.create!(
  domain: 'app2.example.com',
  user_name: 'appuser2',
  company_name: 'Company Two',
  work_hours: '8-4'
)

# Create tickets
puts "Creating tickets..."
ticket1 = Ticket.create!(
  requester_name: 'John Doe',
  requester_email: 'john@example.com',
  requester_phone: '1234567890',
  requester_type: 'employee',
  problem_title: 'Sample Problem 1',
  problem_description: 'This is a sample problem description 1.',
  link: 'http://example.com/1',
  language: 'en',
  status: 'open', # Set status
  priority: 'high', # Set priority
  assignee: user1,
  app: app1
)

ticket2 = Ticket.create!(
  requester_name: 'Jane Smith',
  requester_email: 'jane@example.com',
  requester_phone: '0987654321',
  requester_type: 'client_responsible',
  problem_title: 'Sample Problem 2',
  problem_description: 'This is a sample problem description 2.',
  link: 'http://example.com/2',
  language: 'lv',
  status: 'in_progress', # Set status
  priority: 'medium', # Set priority
  assignee: user2,
  app: app2
)

# Add tags to tickets
ticket1.tag_list.add('urgent', 'bug')
ticket1.save

ticket2.tag_list.add('feature', 'low-priority')
ticket2.save

# Attach files to tickets
ticket1.files.attach(
  io: File.open(Rails.root.join('db', 'seeds', 'files', 'file1.pdf')),
  filename: 'file1.pdf',
  content_type: 'application/pdf'
)

ticket2.files.attach(
  io: File.open(Rails.root.join('db', 'seeds', 'files', 'file2.pdf')),
  filename: 'file2.pdf',
  content_type: 'application/pdf'
)

# Create app_users
AppUser.create!(user: user1, app: app1)
AppUser.create!(user: user2, app: app2)

# Create templates
template1 = Template.create!(
  template_type: 'email',
  name: 'Welcome Email',
  content: 'Welcome to our service!',
  target: 'ticket_auto_reply'
)

template2 = Template.create!(
  template_type: 'email',
  name: 'Progress Update',
  content: 'Your ticket is being processed.',
  target: 'ticket_progress_changes'
)

puts "Seeding completed!"
