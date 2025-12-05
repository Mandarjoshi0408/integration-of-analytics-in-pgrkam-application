# Admin Dashboard Feature

## Overview
This admin dashboard provides real-time statistics and analytics for platform administrators. It displays key metrics such as total users, jobs, applicants, and applications with interactive charts for better data visualization.

## Features

### 1. Statistics Cards
Display key metrics in an easy-to-read format:
- **Total Users**: Number of registered users on the platform
- **Total Jobs**: Total number of job postings
- **Total Applicants**: Number of registered applicants
- **Total Applications**: Number of job applications submitted
- **Active Jobs**: Currently open job positions
- **Average Applications/Job**: Mean number of applications per job

### 2. Interactive Charts
Visualize data trends using `fl_chart`:
- **Jobs by Category**: Pie chart showing job distribution across categories
- **Top Skills in Demand**: Bar chart displaying the most sought-after skills
- **Applications by Status**: Pie chart showing application statuses (pending, accepted, rejected)

## API Endpoint

**URL**: `/admin/dashboard/stats`
**Method**: `GET`
**Authentication**: Required (Bearer token)

### Response Format
```json
{
  "success": true,
  "data": {
    "total_users": 150,
    "total_jobs": 45,
    "total_applicants": 320,
    "total_applications": 1250,
    "active_jobs": 28,
    "avg_applications_per_job": 27.8,
    "job_categories": {
      "Software Development": 15,
      "Data Science": 8,
      "DevOps": 12,
      "Design": 10
    },
    "top_skills": {
      "Python": 120,
      "JavaScript": 95,
      "React": 85,
      "Node.js": 75,
      "AWS": 65
    },
    "application_by_status": {
      "pending": 400,
      "accepted": 650,
      "rejected": 200
    }
  }
}
```

## Implementation Details

### Frontend Structure
- **Page**: `lib/src/ui/admin/admin_dashboard.dart`
- **Provider**: `lib/src/logic/providers/dashboard_provider.dart`
- **Model**: `lib/src/models/responses/dashboard_stats.dart`

### Key Components

1. **AdminDashboardPage** (ConsumerWidget)
   - Fetches dashboard data using Riverpod provider
   - Displays error handling with retry functionality
   - Uses FutureProvider for async data fetching

2. **Dashboard Provider**
   - Family provider that takes auth token as parameter
   - Handles API calls and error management

3. **Dashboard Stats Model**
   - JSON serializable class for type-safe data handling
   - Freezed annotation for immutability

### Styling
- Material Design 3 compatible
- Responsive grid layout (2 columns on mobile)
- Color-coded statistics cards
- Professional shadow effects and rounded corners

## Access Control

The dashboard is restricted to admin users and requires:
1. Valid authentication token
2. Admin role verification (to be implemented on backend)

### Route
**Web Path**: `/admin/dashboard`
**Route Type**: Protected (requires auth token)

## Usage

### Accessing the Dashboard
```dart
context.router.push(const AdminDashboardRoute());
```

### In Navigation
Add a navigation link in the admin menu or profile page:
```dart
ListTile(
  title: const Text('Dashboard'),
  leading: const Icon(Icons.dashboard),
  onTap: () => context.router.push(const AdminDashboardRoute()),
)
```

## Future Enhancements

1. **Date Range Filtering**: Allow admins to filter data by date range
2. **Export Functionality**: Export dashboard data to PDF/CSV
3. **Real-time Updates**: WebSocket connection for live data updates
4. **Advanced Analytics**: Trending analysis, predictive metrics
5. **Role-based Access**: Different dashboards for different admin roles
6. **Audit Trail**: Log all admin actions for compliance

## Backend Integration

### Expected Backend Implementation

Create an endpoint that aggregates the following data:
- User collection: Count and filters
- Job collection: Count by status/category
- Application collection: Count by status
- Skill analysis from applicant profiles

### Database Queries
```javascript
// Example MongoDB aggregation
db.jobs.aggregate([
  {
    $group: {
      _id: "$category",
      count: { $sum: 1 }
    }
  }
])
```

## Security Considerations

1. **Authentication**: Verify auth token validity
2. **Authorization**: Ensure only admin users can access
3. **Data Privacy**: Do not expose sensitive user information
4. **Rate Limiting**: Implement rate limiting on the stats endpoint
5. **Input Validation**: Validate any filter parameters

## Performance Optimization

1. **Caching**: Cache stats for 5-10 minutes to reduce database queries
2. **Pagination**: For large datasets, implement pagination
3. **Lazy Loading**: Load charts only when visible
4. **Debouncing**: Debounce refresh operations

## Testing

### Unit Tests
- Dashboard provider state management
- Stats model serialization/deserialization

### Widget Tests
- Dashboard page rendering
- Chart visualization

### Integration Tests
- End-to-end dashboard flow with mock API

## Troubleshooting

### Common Issues

1. **"Failed to load dashboard data"**
   - Check network connectivity
   - Verify auth token is valid
   - Ensure user has admin permissions

2. **Empty Charts**
   - Verify backend data is being returned
   - Check if data format matches expected structure
   - Review API response in DevTools

3. **Styling Issues**
   - Ensure Flutter version is compatible with fl_chart
   - Check Material Design version compatibility

## Resources

- [fl_chart Documentation](https://github.com/imaNNeoFighT/fl_chart)
- [Flutter Riverpod Guide](https://riverpod.dev/)
- [Flutter JSON Serialization](https://flutter.dev/docs/development/data-and-backend/json)
