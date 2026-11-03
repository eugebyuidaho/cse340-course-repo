CREATE TABLE organization (
    organization_id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    contact_email VARCHAR(255) NOT NULL,
    logo_filename VARCHAR(255) NOT NULL
);

INSERT INTO organization (name, description, contact_email, logo_filename) VALUES
('BrightFuture Builders', 'A nonprofit focused on improving community infrastructure through sustainable construction projects.', 'info@brightfuturebuilders.org', 'brightfuture-logo.png'),
('GreenHarvest Growers', 'An urban farming collective promoting food sustainability and education in local neighborhoods.', 'contact@greenharvest.org', 'greenharvest-logo.png'),
('UnityServe Volunteers', 'A volunteer coordination group supporting local charities and service initiatives.', 'hello@unityserve.org', 'unityserve-logo.png');

CREATE TABLE project (
    project_id SERIAL PRIMARY KEY,
    organization_id INTEGER NOT NULL REFERENCES organization(organization_id),
    title VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(255) NOT NULL,
    project_date DATE NOT NULL
);

INSERT INTO project (organization_id, title, description, location, project_date) VALUES
-- BrightFuture Builders (org 1)
(1, 'Community Park Renovation', 'Rebuilding the local park with sustainable materials.', 'Provo, UT', '2026-03-15'),
(1, 'Senior Center Repairs', 'Repairing roofing and insulation at the senior center.', 'Orem, UT', '2026-04-10'),
(1, 'School Playground Build', 'Constructing an accessible playground for the elementary school.', 'Provo, UT', '2026-05-20'),
(1, 'Bike Path Extension', 'Extending the city bike path by two miles.', 'Lehi, UT', '2026-06-05'),
(1, 'Library Garden Project', 'Creating a reading garden outside the public library.', 'Springville, UT', '2026-07-12'),
-- GreenHarvest Growers (org 2)
(2, 'Urban Rooftop Garden', 'Installing a rooftop vegetable garden downtown.', 'Salt Lake City, UT', '2026-03-22'),
(2, 'School Greenhouse', 'Building a greenhouse for hands-on student learning.', 'Provo, UT', '2026-04-18'),
(2, 'Community Compost Program', 'Setting up neighborhood compost collection points.', 'Orem, UT', '2026-05-30'),
(2, 'Farmers Market Setup', 'Organizing a weekly local farmers market.', 'American Fork, UT', '2026-06-14'),
(2, 'Food Bank Garden', 'Growing fresh produce donated to the local food bank.', 'Spanish Fork, UT', '2026-07-08'),
-- UnityServe Volunteers (org 3)
(3, 'Winter Coat Drive', 'Collecting and distributing coats for families in need.', 'Provo, UT', '2026-01-10'),
(3, 'Homeless Shelter Meals', 'Preparing and serving meals at the downtown shelter.', 'Salt Lake City, UT', '2026-02-14'),
(3, 'Youth Mentorship Day', 'Pairing volunteers with local youth for a day of activities.', 'Orem, UT', '2026-03-28'),
(3, 'River Cleanup', 'Removing trash and debris from the Provo River.', 'Provo, UT', '2026-04-22'),
(3, 'Blood Drive Coordination', 'Organizing a community blood donation event.', 'Lehi, UT', '2026-05-16');
